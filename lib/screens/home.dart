import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:whisky_app/screens/list.dart';
import 'package:whisky_app/screens/favorites.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(items: [
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.home),
          title: Text('Главная'),
        ),
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.book),
          title: Text('Избранное'),
        ),
      ]),
      tabBuilder: (context, index) {
        Widget screen;
        switch(index){
          case 0:
            screen = ListScreen();
            break;
          case 1:
            screen = FavoritesScreen();
            break;
        }
        return screen;
      },
    );
  }
}
