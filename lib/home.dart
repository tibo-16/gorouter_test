import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gorouter_test/main.dart';
import 'package:gorouter_test/profile/profile.dart';

enum Tab { search, watchlist, profile }

extension TabX on Tab {
  static Tab fromString(String value) {
    switch (value) {
      case 'search':
        return Tab.search;
      case 'watchlist':
        return Tab.watchlist;
      case 'profile':
      default:
        return Tab.profile;
    }
  }

  static String valueFromIndex(int index) {
    switch (index) {
      case 0:
        return 'search';
      case 1:
        return 'watchlist';
      case 2:
      default:
        return 'profile';
    }
  }
}

class Home extends StatefulWidget {
  const Home({Key? key, required this.selectedTab}) : super(key: key);

  final Tab selectedTab;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Widget> tabs = [Container(), Container(), Container()];

  @override
  Widget build(BuildContext context) {
    final currentIndex = widget.selectedTab.index;
    // populate tab on first selection
    if (tabs[currentIndex] is Container) {
      tabs[currentIndex] = currentIndex == 0
          ? const Search()
          : (currentIndex == 1 ? const Watchlist() : const ProfileRouter());
    }

    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: tabs,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          final nextTab = TabX.valueFromIndex(index);
          if (nextTab == 'profile' && currentIndex == index) {
            appRouter.profileRouter.go('/');
          }
          context.go('/home/$nextTab');
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'search'),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'watchlist'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'profile'),
        ],
      ),
    );
  }
}

class Search extends StatelessWidget {
  const Search({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
      ),
      body: const Center(
        child: Text('Search'),
      ),
    );
  }
}

class Watchlist extends StatelessWidget {
  const Watchlist({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Watchlist'),
      ),
      body: const Center(
        child: Text('Watchlist'),
      ),
    );
  }
}
