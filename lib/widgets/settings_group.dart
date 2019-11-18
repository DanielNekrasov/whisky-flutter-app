import 'package:flutter/cupertino.dart';
import 'package:whisky_app/styles.dart';

import 'settings_item.dart';

class SettingsGroup extends StatelessWidget {
  SettingsGroup({@required this.items})
      : assert(items != null),
        assert(items.isNotEmpty);

  final List<SettingsItem> items;

  @override
  Widget build(BuildContext context) {
    final dividedItems = <Widget>[items[0]];

    for (int i = 1; i < items.length; i++) {
      dividedItems.add(Container(
        color: Styles.settingsLineation,
        height: 0.5,
      ));
      dividedItems.add(items[i]);
    }

    return Padding(
      padding: EdgeInsets.only(
        top: 22,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              color: CupertinoColors.white,
              border: Border(
                top: const BorderSide(
                  color: Styles.settingsLineation,
                  width: 0,
                ),
                bottom: const BorderSide(
                  color: Styles.settingsLineation,
                  width: 0,
                ),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: dividedItems,
            ),
          ),
        ],
      ),
    );
  }
}
