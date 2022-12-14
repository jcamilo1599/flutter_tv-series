import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../config/use_case_config.dart';
import '../../../domain/models/series/series/serie.dart';
import '../../../resources/environments/environments.dart';
import '../../common/atoms/no_image.dart';
import '../../common/molecules/app_bar.dart';
import '../../common/molecules/stars.dart';
import '../../common/tokens/colors.dart';

class SeriePage extends ConsumerWidget {
  final int index;

  SeriePage({
    required this.index,
    Key? key,
  }) : super(key: key);

  final UseCaseConfig _config = UseCaseConfig();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: const MoleculesAppBar(title: Text('Popular')),
      body: _buildBody(context, ref),
    );
  }

  SafeArea _buildBody(BuildContext context, WidgetRef ref) {
    // Alto para que sea ocupado por el carrusel
    final double height = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom -
        AppBar().preferredSize.height;

    // Obtiene las series guardadas en popular
    final List<SerieModel> series = _config.seriesUseCase.getPopular(ref);

    return SafeArea(
      child: CarouselSlider(
        options: CarouselOptions(
          viewportFraction: 0.7,
          initialPage: index,
          enlargeCenterPage: true,
          enlargeStrategy: CenterPageEnlargeStrategy.height,
          height: height,
        ),
        items: series.map((SerieModel serie) {
          return Column(
            children: <Widget>[
              Container(
                width: 300,
                margin: const EdgeInsets.fromLTRB(20, 18, 20, 10),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(50)),
                  child: _buildImage(serie.posterPath!),
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
              MoleculesStars(stars: (serie.voteAverage ?? 0) / 2),
              Text(
                'IMDb: ${serie.voteAverage}',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(height: 6),
              ElevatedButton(
                onPressed: () =>
                    _config.watchNowUseCase.watch(context, idSerie: serie.id!),
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
      ),
    );
  }

  Widget _buildImage(String posterPath) {
    return Image.network(
      '${Environments.imagePath}$posterPath',
      fit: BoxFit.cover,
      errorBuilder: (_, __, ___) => const AtomsNoImage(),
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
    );
  }
}
