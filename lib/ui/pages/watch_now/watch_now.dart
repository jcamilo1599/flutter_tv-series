import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../config/use_case_config.dart';
import '../../../domain/models/series/series/serie.dart';
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
    return Scaffold(
      appBar: AppBar(
        title: _buildTitle(),
        centerTitle: false,
        actions: <Widget>[_buildAction()],
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          children: <Widget>[
            _buildError(),
            _buildLoading(),
            _buildBody(),
          ],
        ),
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
    Widget response = const SizedBox.shrink();
    final bool showBody = !ref.watch(loadingProvider.state).state &&
        ref.watch(serieProvider.state).state != null &&
        ref.watch(seasonProvider.state).state != null;

    if (showBody) {
      final SerieModel serie = ref.watch(serieProvider.state).state!;

      response = Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _buildImage(serie.seasons![0].posterPath),
          const SizedBox(height: 50),
          Text(
            serie.name!,
            style: Theme.of(context).textTheme.headline2,
            overflow: TextOverflow.fade,
            maxLines: 1,
            softWrap: false,
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 16,
            child: Row(
              children: <Widget>[
                Text(
                  'IMDb: ${serie.voteAverage!.toStringAsFixed(1)}',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const AtomsDividerV(),
                Text(
                  serie.lastAirDate!.year.toString(),
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const AtomsDividerV(),
                Text(
                  '${serie.numberOfSeasons} Seasons',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ),
          const Divider(height: 60),
        ],
      );
    }

    return response;
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
