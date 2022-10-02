import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../config/use_case_config.dart';
import '../../../../../domain/models/series/series/serie.dart';
import '../../../../common/organisms/movie_vertical.dart';
import '../../../../common/tokens/numbers.dart';

class FavoritesPage extends ConsumerWidget {
  FavoritesPage({Key? key}) : super(key: key);

  final UseCaseConfig _config = UseCaseConfig();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<SerieModel> series = _config.favoritesUseCase.getFavorites(ref);

    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: TokensNum.mainSpacing),
      children: List<OrgMovieV>.generate(series.length, (int index) {
        return OrgMovieV(serie: series[index]);
      }),
    );
  }
}
