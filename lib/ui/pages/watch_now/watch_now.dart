import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../config/use_case_config.dart';
import '../../../domain/models/series/series/serie.dart';
import '../../../domain/models/series/series_episode/series_episode_api_resp.dart';
import '../../../domain/models/series/series_season/series_season_api_resp.dart';
import '../../common/atoms/divider_vertical.dart';
import '../../common/atoms/image_network.dart';
import '../../common/atoms/no_image.dart';
import '../../common/tokens/colors.dart';

class WatchNowPage extends ConsumerStatefulWidget {
  final int idSerie;

  const WatchNowPage({
    required this.idSerie,
    Key? key,
  }) : super(key: key);

  @override
  _WatchNowPageState createState() => _WatchNowPageState();
}

class _WatchNowPageState extends ConsumerState<WatchNowPage> {
  final UseCaseConfig _config = UseCaseConfig();

  late final StateProvider<bool> loadingProvider;
  late final StateProvider<SerieModel?> serieProvider;
  late final StateProvider<SeriesSeasonApiRespModel?> seasonProvider;
  late final StateProvider<IconData> iconProvider;

  final PageController _controller = PageController();
  static const Duration _transitionDuration = Duration(milliseconds: 400);
  static const Cubic _transitionCurve = Curves.ease;

  @override
  void initState() {
    super.initState();

    loadingProvider = StateProvider<bool>((_) => true);
    serieProvider = StateProvider<SerieModel?>((_) => null);
    seasonProvider = StateProvider<SeriesSeasonApiRespModel?>((_) => null);

    iconProvider = StateProvider<IconData>(
      (_) => _config.favoritesUseCase.check(ref, idSerie: widget.idSerie),
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _getSerie();
    });
  }

  @override
  Widget build(BuildContext context) {
    final bool showBody = !ref.watch(loadingProvider.state).state &&
        ref.watch(serieProvider.state).state != null &&
        ref.watch(seasonProvider.state).state != null;

    return Scaffold(
      appBar: AppBar(
        title: _buildTitle(),
        centerTitle: false,
        actions: <Widget>[_buildAction()],
      ),
      body: SafeArea(
        child: (ref.watch(loadingProvider.state).state)
            ? _buildLoading()
            : showBody
                ? _buildBody()
                : _buildError(),
      ),
    );
  }

  Widget _buildError() {
    Widget response = const SizedBox.shrink();
    final bool showError = !ref.watch(loadingProvider.state).state &&
        (ref.watch(serieProvider.state).state == null ||
            ref.watch(seasonProvider.state).state == null);

    if (showError) {
      response = Container(
        padding: const EdgeInsets.all(20),
        alignment: Alignment.center,
        child: Text(
          'Se produjo un error, no se pudo cargar la serie.',
          style: Theme.of(context).textTheme.bodyText1,
          textAlign: TextAlign.center,
        ),
      );
    }

    return response;
  }

  Widget _buildTitle() {
    final SerieModel? serie = ref.watch(serieProvider.state).state;

    return ref.watch(loadingProvider.state).state
        ? _buildLoadingTitle()
        : Text(serie != null ? serie.name! : 'Upps...');
  }

  Widget _buildLoadingTitle() {
    return const SizedBox(
      width: 20,
      height: 20,
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildLoading() {
    Widget response = const SizedBox.shrink();

    if (ref.watch(loadingProvider.state).state) {
      response = Align(
        child: Container(
          margin: const EdgeInsets.all(40),
          width: 40,
          height: 40,
          child: const CircularProgressIndicator(),
        ),
      );
    }

    return response;
  }

  Widget _buildAction() {
    Widget response = const SizedBox.shrink();

    final SerieModel? serie = ref.watch(serieProvider.state).state;
    final bool showAction = !ref.watch(loadingProvider.state).state &&
        ref.watch(seasonProvider.state).state != null &&
        serie != null;

    if (showAction) {
      response = IconButton(
        onPressed: () {
          _config.favoritesUseCase.addFavorite(ref, serie: serie);

          // Cambia el icono
          ref.read(iconProvider.notifier).state =
              _config.favoritesUseCase.check(ref, idSerie: serie.id!);
        },
        icon: Icon(
          ref.watch(iconProvider),
          color: TokensColors.yellow,
        ),
      );
    }

    return response;
  }

  Widget _buildBody() {
    final SeriesSeasonApiRespModel season =
        ref.watch(seasonProvider.state).state!;
    final List<SeriesEpisodeApiRespModel> episodes = season.episodes!;

    return PageView(
      controller: _controller,
      children: List<Widget>.generate(episodes.length, (int index) {
        return ListView(
          padding: const EdgeInsets.fromLTRB(16, 10, 16, 30),
          children: <Widget>[
            Row(
              children: <Widget>[
                Text(
                  '${index + 1} Episode',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(fontWeight: FontWeight.w600),
                  overflow: TextOverflow.fade,
                  maxLines: 1,
                  softWrap: false,
                ),
                const Spacer(),
                TextButton(
                  onPressed: index > 0
                      ? () {
                          _controller.previousPage(
                            duration: _transitionDuration,
                            curve: _transitionCurve,
                          );
                        }
                      : null,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const <Widget>[
                      Icon(Icons.arrow_back_ios, size: 14),
                      SizedBox(width: 2),
                      Text('Previous'),
                    ],
                  ),
                ),
                TextButton(
                  onPressed: (episodes.length - 1) > index
                      ? () {
                          _controller.nextPage(
                            duration: _transitionDuration,
                            curve: _transitionCurve,
                          );
                        }
                      : null,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const <Widget>[
                      Text('Next'),
                      SizedBox(width: 2),
                      Icon(Icons.arrow_forward_ios, size: 14),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            _buildImage(episodes[index].stillPath),
            const SizedBox(height: 50),
            Text(
              episodes[index].name ?? '',
              style: Theme.of(context).textTheme.headline2,
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 16,
              child: Row(
                children: <Widget>[
                  Text(
                    'IMDb: ${episodes[index].voteAverage!.toStringAsFixed(1)}',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  const AtomsDividerV(),
                  Text(
                    episodes[index].airDate!.year.toString(),
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  const AtomsDividerV(),
                  Text(
                    'Season ${episodes[index].seasonNumber}',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ),
            const Divider(height: 60),
            Text(
              episodes[index].overview ?? '',
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ],
        );
      }),
    );
  }

  Widget _buildImage(String? poster) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: SizedBox(
        width: double.infinity,
        height: 220,
        child: poster != null
            ? AtomsImageNetwork(path: poster)
            : const AtomsNoImage(),
      ),
    );
  }

  Future<void> _getSerie() async {
    // Obtiene la información de la serie
    ref.read(serieProvider.notifier).state = await _config.seriesUseCase.getOne(
      context,
      idSerie: widget.idSerie.toString(),
    );

    // Obtiene la información de la temporada
    ref.read(seasonProvider.notifier).state =
        await _config.seriesUseCase.getSeason(
      context,
      idSerie: widget.idSerie.toString(),
      idSeason: '1',
    );

    ref.read(loadingProvider.notifier).state = false;
  }
}
