import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../config/use_case_config.dart';
import '../../../domain/models/series/series/serie.dart';
import '../atoms/card.dart';
import '../molecules/stars.dart';
import '../tokens/colors.dart';

class OrgMovieV extends ConsumerWidget {
  final SerieModel serie;

  OrgMovieV({
    required this.serie,
    Key? key,
  }) : super(key: key);

  final UseCaseConfig _config = UseCaseConfig();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /**
     * 140: tamaño del poster
     * 32: padding que se declara desde "home"
     * 30: espacios horizontales del texto
     */
    final double textWidth = MediaQuery.of(context).size.width - 140 - 32 - 30;

    return Container(
      height: 210,
      margin: const EdgeInsets.only(bottom: 40),
      child: Row(
        children: <Widget>[
          AtomCard(poster: serie.posterPath!),
          const SizedBox(width: 20),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ConstrainedBox(
                constraints: BoxConstraints(maxWidth: textWidth),
                child: Text(
                  serie.name ?? '',
                  style: Theme.of(context).textTheme.bodyText1,
                  overflow: TextOverflow.fade,
                  maxLines: 1,
                  softWrap: false,
                ),
              ),
              const SizedBox(height: 10),
              MoleculesStars(stars: (serie.voteAverage ?? 0) / 2),
              const SizedBox(height: 10),
              Text(
                'IMDb: ${serie.voteAverage}',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () {
                      _config.watchNowUseCase
                          .watch(context, idSerie: serie.id!);

                      _config.recentsUseCase.addRecent(ref, serie: serie);
                    },
                    child: Text(
                      'Watch Now',
                      style: Theme.of(context).textTheme.bodyText1?.copyWith(
                            color: TokensColors.black,
                          ),
                    ),
                  ),
                  IconButton(
                    // TODO: validar si ya esta en favoritos
                    onPressed: () =>
                        _config.favoritesUseCase.addFavorite(ref, serie: serie),
                    icon: const Icon(Icons.favorite_border),
                  )
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
