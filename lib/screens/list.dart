import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:whisky_app/data/whiskies_state.dart';
import 'package:whisky_app/data/whisky.dart';
import 'package:whisky_app/widgets/whisky_card.dart';

class ListScreen extends StatelessWidget {
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
    var whiskiesState = Provider.of<WhiskiesState>(context);
    return CupertinoTabView(
      builder: (context) {
        return DecoratedBox(
          decoration: BoxDecoration(color: Color(0xffffffff)),
          child: ListView.builder(
              itemCount: whiskiesState.allWhiskies.length,
              itemBuilder: (context, index) {
                return _generateWhiskyRow(whiskiesState.allWhiskies[index]);
              }),
        );
      },
    );
  }
}
