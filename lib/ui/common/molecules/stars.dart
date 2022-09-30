import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../tokens/colors.dart';

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
      children: List<Widget>.generate(5, (int index) {
        return Icon(
          _buildIcon(index),
          size: 13,
          color: TokensColors.gray,
        );
      }),
    );
  }

  IconData _buildIcon(int index) {
    return (stars > index && stars > (index + 1))
        ? Icons.star
        : (stars > index)
            ? Icons.star_half
            : Icons.star_border_sharp;
  }
}
