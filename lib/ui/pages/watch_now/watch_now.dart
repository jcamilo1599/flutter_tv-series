import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../config/use_case_config.dart';
import '../../../domain/models/series/series/serie.dart';
import '../../../domain/models/series/series_season/series_season_api_resp.dart';
import '../../../resources/environments/environments.dart';

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

  late StateProvider<bool> loadingProvider;
  late StateProvider<SerieModel?> serieProvider;
  late StateProvider<SeriesSeasonApiRespModel?> seasonProvider;

  @override
  void initState() {
    super.initState();

    loadingProvider = StateProvider<bool>((_) => true);
    serieProvider = StateProvider<SerieModel?>((_) => null);
    seasonProvider = StateProvider<SeriesSeasonApiRespModel?>((_) => null);

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
    return ref.watch(loadingProvider.state).state
        ? _buildLoadingTitle()
        : Text(
            ref.watch(serieProvider.state).state != null
                ? ref.watch(serieProvider.state).state!.name!
                : 'Upps...',
          );
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
    final bool showAction = !ref.watch(loadingProvider.state).state &&
        ref.watch(serieProvider.state).state != null &&
        ref.watch(seasonProvider.state).state != null;

    if (showAction) {
      response = IconButton(
        onPressed: () {
          _config.favoritesUseCase.addFavorite(
            ref,
            serie: ref.watch(serieProvider.state).state!,
          );
        },
        icon: const Icon(Icons.favorite_border),
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
      response = Column(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: SizedBox(
              width: double.infinity,
              height: 220,
              child: Image.network(
                '${Environments.imagePath}${ref.watch(serieProvider.state).state!.posterPath}',
                fit: BoxFit.cover,
                loadingBuilder: (
                  BuildContext context,
                  Widget child,
                  ImageChunkEvent? loadingProgress,
                ) {
                  if (loadingProgress == null) {
                    return child;
                  }

                  return Align(
                    child: SizedBox(
                      width: 60,
                      height: 60,
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                loadingProgress.expectedTotalBytes!
                            : null,
                      ),
                    ),
                  );
                },
              ),
            ),
          )
        ],
      );
    }

    return response;
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
