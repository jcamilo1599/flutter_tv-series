import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'config/provider.dart';
import 'infrastructure/handlers/handlers.dart';
import 'resources/hide_focus.dart';
import 'resources/themes/dark.dart';

class App extends ConsumerWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String token = ref.watch(sessionProvider).token;

    return GestureDetector(
      onTap: () => hideFocus(context),
      child: MaterialApp(
        title: 'TV Series',
        debugShowCheckedModeBanner: false,
        routes: Handlers.getRoutes(context, token),
        initialRoute: Handlers.getInitialRoute(),
        theme: Themes.dark,
      ),
    );
  }
}
