import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../config/use_case_config.dart';
import '../../../domain/models/start.dart';
import 'widgets/home/home.dart';

class StartPage extends ConsumerWidget {
  static const String routeName = '/';

  StartPage({Key? key}) : super(key: key);

  final UseCaseConfig _config = UseCaseConfig();

  // Determina si los botones del cuerpo se mostraran
  final StateProvider<int> selectedNavBarProvider =
      StateProvider<int>((_) => 0);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int selectedNavBar = ref.watch(selectedNavBarProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          _options[selectedNavBar].title,
          style: Theme.of(context).textTheme.headline6,
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () => _config.startUseCase.closeSession(context, ref),
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      body: _options[selectedNavBar].body,
      bottomNavigationBar: _buildNavBar(ref, selectedNavBar: selectedNavBar),
    );
  }

  Widget _buildNavBar(
    WidgetRef ref, {
    required int selectedNavBar,
  }) {
    return BottomNavigationBar(
      items: _options
          .map((PageModel option) => BottomNavigationBarItem(
                icon: Icon(option.icon),
                label: option.title,
              ))
          .toList(),
      currentIndex: selectedNavBar,
      selectedItemColor: Colors.amber[800],
      onTap: (int index) => _onNavBarChange(ref, index),
    );
  }

  static final List<PageModel> _options = <PageModel>[
    PageModel(
      title: 'Home',
      icon: Icons.home_filled,
      body: HomePage(),
    ),
    PageModel(
      title: 'Favorites',
      icon: Icons.favorite_border,
      body: const SizedBox.shrink(),
    ),
    PageModel(
      title: 'Recent',
      icon: Icons.rotate_left,
      body: const SizedBox.shrink(),
    ),
    PageModel(
      title: 'Search',
      icon: Icons.search,
      body: const SizedBox.shrink(),
    ),
  ];

  void _onNavBarChange(WidgetRef ref, int index) {
    ref.read(selectedNavBarProvider.state).state = index;
  }
}
