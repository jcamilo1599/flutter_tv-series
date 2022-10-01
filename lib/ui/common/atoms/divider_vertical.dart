import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../tokens/colors.dart';

class AtomsDividerV extends ConsumerWidget {
  const AtomsDividerV({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      color: TokensColors.gray,
      width: 1,
      height: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 6),
    );
  }
}
