import 'package:belly_kitchen/ui/widgets/tabs/search_tab.dart';
import 'package:belly_kitchen/ui/widgets/tabs/home_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../widgets/tabs/favorite_tab.dart';

const List<Widget> tabs = [
  FavTab(),
  HomeTab(),
  SearchTab(),
];
const List<String> tabsTitle = [
  'Favorite',
  'Welcome',
  'Search',
];

class Home extends HookConsumerWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = useState(1);
    void onItemTapped(int index) => selectedIndex.value = index;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.dehaze_rounded,
            color: Theme.of(context).iconTheme.color,
          ),
          onPressed: () => Navigator.pushNamed(context, '/settings'),
          splashRadius: 24.0,
        ),
        title: Text(
          tabsTitle[selectedIndex.value],
          style: Theme.of(context).textTheme.caption,
        ),
      ),
      body: Center(child: tabs[selectedIndex.value]),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark_outline_rounded),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home_rounded),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.manage_search),
            label: '',
          ),
        ],
        currentIndex: selectedIndex.value,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: onItemTapped,
      ),
    );
  }
}
