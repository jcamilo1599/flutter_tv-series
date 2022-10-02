import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../config/use_case_config.dart';
import '../../../domain/models/series/series/serie.dart';
import '../molecules/card.dart';
import '../molecules/stars.dart';
import '../tokens/colors.dart';

class OrgMovieV extends ConsumerStatefulWidget {
  final SerieModel serie;

  const OrgMovieV({
    required this.serie,
    Key? key,
  }) : super(key: key);

  @override
  _OrgMovieVState createState() => _OrgMovieVState();
}

class _OrgMovieVState extends ConsumerState<OrgMovieV> {
  final UseCaseConfig _config = UseCaseConfig();

  late final StateProvider<IconData> iconProvider;

  @override
  void initState() {
    super.initState();

    iconProvider = StateProvider<IconData>(
      (_) => _config.favoritesUseCase.check(ref, idSerie: widget.serie.id!),
    );
  }

  @override
  Widget build(BuildContext context) {
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
          MoleculesCard(poster: widget.serie.posterPath!),
          const SizedBox(width: 20),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ConstrainedBox(
                constraints: BoxConstraints(maxWidth: textWidth),
                child: Text(
                  widget.serie.name ?? '',
                  style: Theme.of(context).textTheme.bodyText1,
                  overflow: TextOverflow.fade,
                  maxLines: 1,
                  softWrap: false,
                ),
              ),
              const SizedBox(height: 10),
              MoleculesStars(stars: (widget.serie.voteAverage ?? 0) / 2),
              const SizedBox(height: 10),
              Text(
                'IMDb: ${widget.serie.voteAverage}',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () => _config.watchNowUseCase.watch(
                      context,
                      idSerie: widget.serie.id!,
                    ),
                    child: Text(
                      'Watch Now',
                      style: Theme.of(context).textTheme.bodyText1?.copyWith(
                            color: TokensColors.black,
                          ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      _config.favoritesUseCase
                          .addFavorite(ref, serie: widget.serie);

                      // Cambia el icono
                      ref.read(iconProvider.notifier).state = _config
                          .favoritesUseCase
                          .check(ref, idSerie: widget.serie.id!);
                    },
                    icon: Icon(
                      ref.watch(iconProvider),
                      color: TokensColors.yellow,
                    ),
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
