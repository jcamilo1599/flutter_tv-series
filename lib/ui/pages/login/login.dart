import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common/tokens/colors.dart';
import 'widgets/body.dart';

class LoginPage extends ConsumerWidget {
  static const String routeName = '/';

  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          ..._buildBackground(),
          SafeArea(
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 200),
                child: LoginBody(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildBackground() {
    return <Widget>[
      // Imagen
      Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/cover.png'),
            fit: BoxFit.cover,
          ),
        ),
      ),

      // Degradado
      Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: <Color>[
              Colors.transparent,
              TokensColors.black,
            ],
          ),
        ),
      ),
    ];
  }
}
