import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../resources/environments/environments.dart';
import 'no_image.dart';

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
        ),
      ),
    );
  }
}
