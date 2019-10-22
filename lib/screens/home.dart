import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:whisky_app/screens/list.dart';

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
          icon: Icon(CupertinoIcons.book),
          title: Text('Favorites'),
        ),
      ]),
      tabBuilder: (context, index) {
        return ListScreen();
      },
    );
  }
}