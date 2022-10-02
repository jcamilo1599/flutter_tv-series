import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/models/series/series/serie.dart';
import '../molecules/card.dart';
import '../molecules/stars.dart';

class OrgMovieH extends ConsumerWidget {
  final SerieModel serie;
  final void Function()? onTap;

  const OrgMovieH({
    required this.serie,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: 140,
        height: 280,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            MoleculesCard(poster: serie.posterPath!),
            Text(
              serie.name ?? '',
              style: Theme.of(context).textTheme.bodyText1,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const Spacer(),
            MoleculesStars(stars: (serie.voteAverage ?? 0) / 2),
          ],
        ),
      ),
    );
  }
}
