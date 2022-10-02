import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../tokens/colors.dart';
import '../tokens/numbers.dart';

class MoleculesStars extends ConsumerWidget {
  final double stars;

  const MoleculesStars({
    required this.stars,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List<Widget>.generate(TokensNum.starsNumber, (int index) {
        return Icon(
          _buildIcon(index),
          size: TokensNum.starsSize,
          color: TokensColors.gray,
        );
      }),
    );
  }

  IconData _buildIcon(int index) {
    final bool isStar = stars > index && stars > (index + 1);
    final bool isStarHalf = stars > index;

    return isStar
        ? Icons.star
        : isStarHalf
            ? Icons.star_half
            : Icons.star_border_sharp;
  }
}
