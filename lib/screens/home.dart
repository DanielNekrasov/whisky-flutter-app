import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:whisky_app/screens/favorites.dart';
import 'package:whisky_app/screens/list.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(activeColor: Color(0xff000000), items: [
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.book),
          activeIcon: Icon(CupertinoIcons.book_solid),
          title: Text(
            'Каталог',
          ),
        ),
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.heart),
          activeIcon: Icon(CupertinoIcons.heart_solid),
          title: Text(
            'Избранное',
          ),
        ),
      ]),
      tabBuilder: (context, index) {
        Widget screen;
        switch (index) {
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
