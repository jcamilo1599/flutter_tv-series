import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../config/provider.dart';
import '../../../domain/models/series/series/serie.dart';
import '../../../domain/models/series/series/series_api_resp.dart';
import '../../../resources/environments/environments.dart';
import '../../common/molecules/stars.dart';
import '../../common/tokens/colors.dart';

class SeriePage extends ConsumerWidget {
  final int index;

  const SeriePage({
    required this.index,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String seriesString = ref.watch(sessionProvider).popular;
    final SeriesApiRespModel series =
        SeriesApiRespModel.fromJson(json.decode(seriesString));

    // Alto para que sea ocupado por el carrusel
    final double height = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom -
        AppBar().preferredSize.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Popular'),
        centerTitle: false,
      ),
      body: SafeArea(
        child: CarouselSlider(
          options: CarouselOptions(
            viewportFraction: 0.7,
            initialPage: index,
            enlargeCenterPage: true,
            enlargeStrategy: CenterPageEnlargeStrategy.height,
            height: height,
          ),
          items: series.results!.map((SerieModel serie) {
            return Column(
              children: <Widget>[
                Container(
                  width: 300,
                  margin: const EdgeInsets.fromLTRB(20, 18, 20, 10),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(50)),
                    child: Image.network(
                      '${Environments.imagePath}${serie.posterPath}',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    serie.name!,
                    style: Theme.of(context).textTheme.headline5,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.fade,
                    maxLines: 1,
                    softWrap: false,
                  ),
                ),
                const SizedBox(height: 6),
                MoleculesStars(stars: serie.voteAverage!),
                Text(
                  'IMDb: ${serie.voteAverage}',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const SizedBox(height: 6),
                ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    'Watch Now',
                    style: Theme.of(context).textTheme.bodyText1?.copyWith(
                          color: TokensColors.black,
                        ),
                  ),
                ),
              ],
            );
          }).toList(),
          //items: imageSliders(),
        ),
      ),
    );
  }
}
