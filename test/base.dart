import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BaseTest extends ConsumerWidget {
  final Widget home;

  const BaseTest({
    required this.home,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ProviderScope(
      child: MaterialApp(
        home: Scaffold(body: home),
      ),
    );
  }
}
