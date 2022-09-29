import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../config/provider/provider.dart';
import '../../../infrastructure/handlers/handlers.dart';
import '../../common/tokens/colors.dart';

// Determina si los botones del cuerpo se mostraran
final StateProvider<int> selectedNavBarProvider = StateProvider<int>((_) => 0);

class StartPage extends ConsumerWidget {
  static const String routeName = '/';

  const StartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int selectedNavBar = ref.watch(selectedNavBarProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: TokensColors.black,
        title: Text(
          _titles[selectedNavBar],
          style: Theme.of(context).textTheme.headline6,
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              ref.read(sessionProvider.notifier).token = '';

              Future<void>.delayed(const Duration(milliseconds: 100), () {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  Handlers.getInitialRoute(),
                  (Route<dynamic> route) => false,
                );
              });
            },
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      body: Center(
        child: _pages.elementAt(selectedNavBar),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: const Icon(Icons.home_filled),
            label: _titles[0],
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.favorite_border),
            label: _titles[1],
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.rotate_left),
            label: _titles[2],
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.search),
            label: _titles[3],
          ),
        ],
        currentIndex: selectedNavBar,
        selectedItemColor: Colors.amber[800],
        onTap: (int index) => _onNavBarChange(ref, index),
      ),
    );
  }

  static const List<String> _titles = <String>[
    'Home',
    'Favorites',
    'Recent',
    'Search',
  ];

  static const List<Widget> _pages = <Widget>[
    Text(
      'Index 0',
    ),
    Text(
      'Index 1',
    ),
    Text(
      'Index 2',
    ),
    Text(
      'Index 3',
    ),
  ];

  void _onNavBarChange(WidgetRef ref, int index) {
    ref.read(selectedNavBarProvider.state).state = index;
  }
}
