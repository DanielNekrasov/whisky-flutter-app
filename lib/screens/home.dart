import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:whisky_app/screens/list.dart';
import 'package:whisky_app/screens/search.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(items: [
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.home),
          title: Text('Home'),
        ),
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.search),
          title: Text('Search'),
        ),
      ]),
      tabBuilder: (context, index) {
        if (index == 0) {
          return ListScreen();
        } else {
          return SearchScreen();
        }
      },
    );
  }
}
