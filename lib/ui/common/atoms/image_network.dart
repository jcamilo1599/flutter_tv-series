import 'package:flutter/material.dart';

import '../../../resources/environments/environments.dart';
import 'no_image.dart';

class AtomsImageNetwork extends StatelessWidget {
  final String path;

  const AtomsImageNetwork({
    required this.path,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(
      '${Environments.imagePath}$path',
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
          child: Container(
            width: 60,
            height: 60,
            margin: const EdgeInsets.all(20),
            child: CircularProgressIndicator(
              value: loadingProgress.expectedTotalBytes != null
                  ? loadingProgress.cumulativeBytesLoaded /
                      loadingProgress.expectedTotalBytes!
                  : null,
            ),
          ),
        );
      },
    );
  }
}
