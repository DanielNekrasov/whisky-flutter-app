// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whisky_app/data/whisky.dart';
import 'package:whisky_app/screens/details.dart';
import 'package:whisky_app/styles.dart';

class ZoomClipAssetImage extends StatelessWidget {
  const ZoomClipAssetImage(
      {@required this.zoom,
      this.height,
      this.width,
      @required this.imageAsset});

  final double zoom;
  final double height;
  final double width;
  final String imageAsset;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      alignment: Alignment.center,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: OverflowBox(
          maxHeight: height * zoom,
          maxWidth: width * zoom,
          child: FadeInImage.assetNetwork(
            fit: BoxFit.cover,
            placeholder: 'assets/images/whisky.jpg',
            fadeInCurve: Curves.easeOutExpo,
            image: imageAsset,
            height: 300.0,
          ),
        ),
      ),
    );
  }
}

class WhiskyHeadline extends StatelessWidget {
  final Whisky whisky;

  const WhiskyHeadline(this.whisky);

  Widget _buildWhiskyTypeDot(WhiskyCategory category) {
    return Container(
      height: 10,
      width: 10,
      decoration: BoxDecoration(
        color: accentColors[category],
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push<void>(CupertinoPageRoute(
        builder: (context) => DetailsScreen(whisky.id),
        fullscreenDialog: true,
      )),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ZoomClipAssetImage(
            imageAsset: whisky.imagePath,
            zoom: 2.4,
            height: 72,
            width: 72,
          ),
          SizedBox(width: 8),
          Flexible(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: <Widget>[
                    Flexible(
                      child: Text(
                        whisky.name,
                        style: Styles.headlineName,
                        overflow: TextOverflow.ellipsis,
                        softWrap: false,
                      ),
                    ),
                    SizedBox(
                      width: 8.0,
                    ),
                    _buildWhiskyTypeDot(whisky.category),
                  ],
                ),
                Text(
                  whisky.categoryName,
                  style: Styles.headlineDescription,
                ),
                Text(
                  whisky.region,
                  style: Styles.headlineDescription,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
