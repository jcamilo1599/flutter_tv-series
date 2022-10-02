import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../config/use_case_config.dart';
import '../../../domain/models/start.dart';
import 'widgets/favorites/favorites.dart';
import 'widgets/home/home.dart';
import 'widgets/recents/recents.dart';

class StartPage extends ConsumerStatefulWidget {
  static const String routeName = '/';

  const StartPage({Key? key}) : super(key: key);

  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends ConsumerState<StartPage> {
  final UseCaseConfig _config = UseCaseConfig();
  late final StateProvider<int> selectedNavBarProvider;

  @override
  void initState() {
    selectedNavBarProvider = StateProvider<int>((_) => 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
      body: FavoritesPage(),
    ),
    PageModel(
      title: 'Recent',
      icon: Icons.rotate_left,
      body: RecentsPage(),
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
