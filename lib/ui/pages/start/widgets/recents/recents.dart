import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../config/use_case_config.dart';
import '../../../../../domain/models/series/series/serie.dart';
import '../../../../../domain/models/series/series/series_api_resp.dart';
import '../../../../common/atoms/image_network.dart';
import '../../../../common/tokens/numbers.dart';

class RecentsPage extends ConsumerWidget {
  RecentsPage({Key? key}) : super(key: key);

  final UseCaseConfig _config = UseCaseConfig();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FutureBuilder<SeriesApiRespModel>(
      future: _config.seriesUseCase.getAiringToday(),
      builder: (_, AsyncSnapshot<SeriesApiRespModel> snapshot) {
        // Determina si hay datos y la respuesta fue correcta
        final bool hasData = snapshot.hasData &&
            snapshot.connectionState == ConnectionState.done;

        if (hasData) {
          return _buildSeries(
            context,
            series: snapshot.data!.results!,
          );
        } else if (snapshot.hasError) {
          return _buildSeriesError(context);
        } else {
          return _buildLoading();
        }
      },
    );
  }

  Widget _buildSeries(
    BuildContext context, {
    required List<SerieModel> series,
  }) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      children: List<Widget>.generate(series.length, (int index) {
        return Column(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(TokensNum.borderRadius),
              child: SizedBox(
                height: 360,
                child: AtomsImageNetwork(path: series[index].posterPath!),
              ),
            ),
            const SizedBox(height: 30),
            Text(
              series[index].name ?? '',
              style: Theme.of(context).textTheme.headline3,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: TokensNum.mainSpacing),
            Text(
              '- episodes of ${series[index].numberOfEpisodes ?? '-'}',
              style: Theme.of(context).textTheme.bodySmall,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.bottomRight,
              child: TextButton(
                onPressed: () => _config.watchNowUseCase
                    .watch(context, idSerie: series[index].id!),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const <Widget>[
                    Text('Go to view'),
                    SizedBox(width: 10),
                    Icon(Icons.arrow_forward_ios, size: 14)
                  ],
                ),
              ),
            ),
            const SizedBox(height: 80),
          ],
        );
      }),
    );
  }

  Widget _buildSeriesError(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      alignment: Alignment.center,
      child: Text(
        'Se produjo un error, no se pudieron cargar las series',
        style: Theme.of(context).textTheme.bodyText1,
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildLoading() {
    return Align(
      child: Container(
        margin: const EdgeInsets.all(40),
        width: 40,
        height: 40,
        child: const CircularProgressIndicator(),
      ),
    );
  }
}
