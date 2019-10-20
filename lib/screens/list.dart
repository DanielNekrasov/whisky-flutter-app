import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:whisky_flutter_app/data/app_state.dart';
import 'package:whisky_flutter_app/data/whisky.dart';

class ListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabView(
      builder: (context) {
        return DecoratedBox(
          decoration: BoxDecoration(color: Color(0xffffffff)),
          child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              Whisky whisky = Provider.of<AppState>(context).getWhisky(index);
              return ListTile(
                title: Text(whisky.name),
              );
            }
          ),
        );
      },
    );
  }
}
