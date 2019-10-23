// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:whisky_app/data/whiskies_state.dart';
import 'package:whisky_app/data/whisky.dart';
import 'package:whisky_app/widgets/search_bar.dart';
import 'package:whisky_app/widgets/whisky_headline.dart';
import 'package:whisky_app/styles.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final controller = TextEditingController();
  final focusNode = FocusNode();
  String terms = '';

  @override
  void initState() {
    super.initState();
    controller.addListener(_onTextChanged);
  }

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  void _onTextChanged() {
    setState(() => terms = controller.text);
  }

  Widget _createSearchBox() {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: SearchBar(
        controller: controller,
        focusNode: focusNode,
      ),
    );
  }

  Widget _buildSearchResults(List<Whisky> whiskies) {
    if (whiskies.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Text(
            'No whiskies matching your search terms were found.',
            style: Styles.headlineDescription,
          ),
        ),
      );
    }

    return ListView.builder(
      itemCount: whiskies.length,
      itemBuilder: (context, i) {
        return Padding(
          padding: EdgeInsets.only(left: 16, right: 16, bottom: 24),
          child: WhiskyHeadline(whiskies[i]),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<WhiskiesState>(context);

    return CupertinoTabView(
      builder: (context) {
        return DecoratedBox(
          decoration: BoxDecoration(
            color: Styles.scaffoldBackground,
          ),
          child: SafeArea(
            bottom: false,
            child: Column(
              children: [
                _createSearchBox(),
                Expanded(
                  child: _buildSearchResults(model.searchVeggies(terms)),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
