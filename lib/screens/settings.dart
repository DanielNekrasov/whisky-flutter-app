// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:whisky_app/styles.dart';
import 'package:whisky_app/widgets/settings_group.dart';
import 'package:whisky_app/widgets/settings_item.dart';

class SettingScreen extends StatelessWidget {
  SettingsItem _buildAboutItem(BuildContext context) {
    return SettingsItem(
      label: 'О приложении',
      icon: SettingsIcon(
        icon: Styles.infoIcon,
      ),
      content: SettingsNavigationIndicator(),
      onPress: () {
        Navigator.of(context).push<void>(
          CupertinoPageRoute(
            builder: (context) => null,
            title: 'О приложении',
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Container(
        color: Styles.scaffoldBackground,
        child: CustomScrollView(
          slivers: <Widget>[
            CupertinoSliverNavigationBar(
              largeTitle: Text('Инфо'),
            ),
            SliverSafeArea(
              top: false,
              sliver: SliverList(
                delegate: SliverChildListDelegate(
                  <Widget>[
                    SettingsGroup(
                      items: [_buildAboutItem(context)],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
