import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../atoms/image_network.dart';
import '../tokens/numbers.dart';

class MoleculesCard extends ConsumerWidget {
  final String poster;

  const MoleculesCard({
    required this.poster,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(TokensNum.borderRadius),
      child: SizedBox(
        width: 140,
        height: 210,
        child: AtomsImageNetwork(path: poster),
      ),
    );
  }
}
