import 'package:flutter/material.dart';

class AtomsNoImage extends StatelessWidget {
  const AtomsNoImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/no-image.jpg'),
          fit: BoxFit.cover,
        ),
      ) /* add child content here */,
    );
  }
}
