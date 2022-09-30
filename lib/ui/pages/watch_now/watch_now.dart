import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../config/use_case_config.dart';
import '../../../domain/models/series/series_one/series_one_api_resp.dart';

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
  late StateProvider<SeriesOneApiRespModel?> serieProvider;

  @override
  void initState() {
    super.initState();

    loadingProvider = StateProvider<bool>((_) => true);
    serieProvider = StateProvider<SeriesOneApiRespModel?>((_) => null);

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
      ),
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            _buildError(),
            _buildLoading(),
          ],
        ),
      ),
    );
  }

  Widget _buildError() {
    Widget response = const SizedBox.shrink();

    if (!ref.watch(loadingProvider.state).state && ref.watch(serieProvider.state).state == null) {
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

  Future<void> _getSerie() async {
    ref.read(serieProvider.notifier).state = await _config.seriesUseCase.getOne(
      context,
      idSerie: widget.idSerie.toString(),
    );

    ref.read(loadingProvider.notifier).state = false;
  }
}
