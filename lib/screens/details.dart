// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:whisky_app/data/app_state.dart';
import 'package:whisky_app/data/whisky.dart';
import 'package:whisky_app/styles.dart';
import 'package:whisky_app/widgets/close_button.dart';
import 'package:whisky_app/widgets/rating_row.dart';

class DetailsScreen extends StatefulWidget {
  final int id;

  DetailsScreen(this.id);

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  Widget _buildHeader(BuildContext context, AppState model) {
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
    final model = Provider.of<AppState>(context);

    return CupertinoPageScaffold(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildHeader(context, model),
          Expanded(
            child: ListView(
              children: [InfoView(widget.id)],
            ),
          ),
        ],
      ),
    );
  }
}

class InfoView extends StatelessWidget {
  final int id;

  const InfoView(this.id);

  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);
    final whisky = appState.getWhisky(id);

    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                whisky.categoryName,
                style: Styles.detailsCategoryText,
              ),
            ],
          ),
          SizedBox(height: 8),
          Text(
            whisky.name,
            style: Styles.detailsTitleText,
          ),
          SizedBox(height: 8),
          RatingRow(whisky.rating),
          SizedBox(height: 8),
          Text(
            whisky.description,
            style: Styles.detailsDescriptionText,
          ),
          DataTable(whisky),
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
              Text('Сохранить в избранное'),
            ],
          ),
        ],
      ),
    );
  }
}

class DataTable extends StatelessWidget {
  const DataTable(this.whisky);
  final Whisky whisky;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 16),
        Container(
          child: Column(
            children: [
              Table(
                children: [
                  TableRow(
                    children: [
                      TableCell(
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 16.0),
                          child: Text(
                            'Регион:',
                            style: Styles.detailsTableLabelText,
                          ),
                        ),
                      ),
                      TableCell(
                        child: Text(
                          whisky.region,
                          textAlign: TextAlign.end,
                          style: Styles.detailsTableValueText,
                        ),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      TableCell(
                        child: Text(
                          'Аромат:',
                          style: Styles.detailsTableLabelText,
                        ),
                      ),
                      TableCell(
                        child: Text(
                          '${whisky.fragranceName}',
                          textAlign: TextAlign.end,
                          style: Styles.detailsTableValueText,
                        ),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      TableCell(
                        child: Text(
                          'Вкус:',
                          style: Styles.detailsTableLabelText,
                        ),
                      ),
                      TableCell(
                        child: Text(
                          '${whisky.tasteName}',
                          textAlign: TextAlign.end,
                          style: Styles.detailsTableValueText,
                        ),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      TableCell(
                        child: Text(
                          'Послевкусие:',
                          style: Styles.detailsTableLabelText,
                        ),
                      ),
                      TableCell(
                        child: Text(
                          '${whisky.afterTasteName}',
                          textAlign: TextAlign.end,
                          style: Styles.detailsTableValueText,
                        ),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      TableCell(
                        child: Text(
                          'Крепость:',
                          style: Styles.detailsTableLabelText,
                        ),
                      ),
                      TableCell(
                        child: Text(
                          '${whisky.abv}',
                          textAlign: TextAlign.end,
                          style: Styles.detailsTableValueText,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Text(
                  whisky.note,
                  style: Styles.detailsTableNoteText,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
