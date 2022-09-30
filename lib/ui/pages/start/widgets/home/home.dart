import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../config/use_case_config.dart';
import '../../../../../domain/models/series/series/serie.dart';
import '../../../../../domain/models/series/series/series_api_resp.dart';
import '../../../../common/organisms/movie_horizontal.dart';
import '../../../../common/organisms/movie_vertical.dart';

class HomePage extends ConsumerWidget {
  final UseCaseConfig _config = UseCaseConfig();

  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      children: <Widget>[
        _buildBuilderPopular(context, ref),
        const Divider(),
        _buildBuilderRecommendations(context),
      ],
    );
  }

  Widget _buildBuilderPopular(BuildContext context, WidgetRef ref) {
    return FutureBuilder<SeriesApiRespModel>(
      future: _config.seriesUseCase.getSeries(ref),
      builder: (_, AsyncSnapshot<SeriesApiRespModel> snapshot) {
        // Determina si hay datos y la respuesta fue correcta
        final bool hasData = snapshot.hasData &&
            snapshot.connectionState == ConnectionState.done;

        if (hasData) {
          return _buildSeriesHorizontal(
            context,
            results: snapshot.data!.results!,
          );
        } else if (snapshot.hasError) {
          return _buildSeriesError(context);
        } else {
          return _buildLoading();
        }
      },
    );
  }

  Widget _buildBuilderRecommendations(BuildContext context) {
    return FutureBuilder<SeriesApiRespModel>(
      future: _config.seriesUseCase.getTopRated(),
      builder: (_, AsyncSnapshot<SeriesApiRespModel> snapshot) {
        // Determina si hay datos y la respuesta fue correcta
        final bool hasData = snapshot.hasData &&
            snapshot.connectionState == ConnectionState.done;

        if (hasData) {
          return _buildSeriesVertical(
            context,
            results: snapshot.data!.results!,
          );
        } else if (snapshot.hasError) {
          return _buildSeriesError(context);
        } else {
          return _buildLoading();
        }
      },
    );
  }

  Widget _buildSeriesHorizontal(
    BuildContext context, {
    required List<SerieModel> results,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Popular',
          style: Theme.of(context).textTheme.headline5,
        ),
        const SizedBox(height: 16),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Wrap(
            spacing: 16,
            children: List<OrgMovieH>.generate(results.length, (int index) {
              return OrgMovieH(
                serie: results[index],
                onTap: () => _config.seriesUseCase.showSerie(
                  context,
                  index: index,
                ),
              );
            }),
          ),
        ),
        const SizedBox(height: 10),
        Align(
          alignment: Alignment.bottomRight,
          child: TextButton(
            onPressed: () {},
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: const <Widget>[
                Text('See All'),
                SizedBox(width: 10),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 14,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSeriesVertical(
    BuildContext context, {
    required List<SerieModel> results,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 16),
        Text(
          'Recommendations',
          style: Theme.of(context).textTheme.headline5,
        ),
        const SizedBox(height: 16),
        Column(
          children: List<OrgMovieV>.generate(results.length, (int index) {
            return OrgMovieV(serie: results[index]);
          }),
        ),
      ],
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
