// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:whisky_app/data/app_state.dart';
import 'package:whisky_app/data/whisky.dart';
import 'package:whisky_app/styles.dart';
import 'package:whisky_app/widgets/whisky_card.dart';

class FavoritesScreen extends StatelessWidget {
  Widget _generateWhiskyRow(Whisky whisky) {
    return Padding(
      padding: EdgeInsets.only(left: 16, right: 16, bottom: 24),
      child: FutureBuilder<Set<WhiskyCategory>>(
          future: null,
          builder: (context, snapshot) {
            return WhiskyCard(whisky);
          }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoTabView(
      builder: (context) {
        final model = Provider.of<AppState>(context);

        return CupertinoPageScaffold(
          navigationBar: CupertinoNavigationBar(
            middle: Text('Избранное'),
          ),
          child: Center(
            child: model.favoriteWhiskies.isEmpty
                ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Text(
                      'Список пуст.',
                      style: Styles.headlineDescription,
                    ),
                  )
                : ListView.builder(
                    itemCount: model.favoriteWhiskies.length,
                    itemBuilder: (context, index) {
                      return _generateWhiskyRow(model.favoriteWhiskies[index]);
                    },
                ),
          ),
        );
      },
    );
  }
}
