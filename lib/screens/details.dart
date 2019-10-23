// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:whisky_app/widgets/close_button.dart';
import 'package:whisky_app/data/whiskies_state.dart';
import 'package:whisky_app/data/whisky.dart';
import 'package:whisky_app/styles.dart';

class InfoView extends StatelessWidget {
  final int id;

  const InfoView(this.id);

  Widget build(BuildContext context) {
    final appState = Provider.of<WhiskiesState>(context);
    final whisky = appState.getWhisky(id);

    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              FutureBuilder<Set<WhiskyCategory>>(
                future: null,
                builder: (context, snapshot) {
                  return Text(
                    whisky.category.toUpperCase(),
                    style: Styles.detailsCategoryText,
                  );
                },
              ),
              Spacer(),
            ],
          ),
          SizedBox(height: 8),
          Text(
            whisky.name,
            style: Styles.detailsTitleText,
          ),
          SizedBox(height: 8),
          Text(
            whisky.description,
            style: Styles.detailsDescriptionText,
          ),
          SizedBox(height: 24),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              CupertinoSwitch(
                value: whisky.isFavorite,
                onChanged: (value) {
                  appState.setFavorite(id, value);
                },
              ),
              SizedBox(width: 8),
              Text('Save to Favorites'),
            ],
          ),
        ],
      ),
    );
  }
}

class DetailsScreen extends StatefulWidget {
  final int id;

  DetailsScreen(this.id);

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  Widget _buildHeader(BuildContext context, WhiskiesState model) {
    final whisky = model.getWhisky(widget.id);
    return Container(
      height: 170,
      child: Stack(
        children: [
          Positioned(
            right: 0,
            left: 0,
            child: FadeInImage.assetNetwork(
              fit: BoxFit.cover,
              alignment: Alignment.center,
              placeholder: 'assets/images/whisky.jpg',
              fadeInCurve: Curves.easeOutExpo,
              image: whisky.imagePath,
              height: 170,
            ),
          ),
          Positioned(
            top: 16,
            left: 16,
            child: SafeArea(
              child: CloseButton(() {
                Navigator.of(context).pop();
              }),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<WhiskiesState>(context);

    return CupertinoPageScaffold(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildHeader(context, appState),
          Expanded(
            child: ListView(
              children: [
                InfoView(widget.id)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
