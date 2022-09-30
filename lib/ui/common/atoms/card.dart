import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../resources/environments/environments.dart';

class AtomCard extends ConsumerWidget {
  final String poster;

  const AtomCard({
    required this.poster,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: SizedBox(
        width: 140,
        height: 210,
        child: Image.network(
          '${Environments.imagePath}$poster',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
