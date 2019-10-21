import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';

abstract class Styles {
  static const appBackground = Color(0xffd0d0d0);

  static const cardTitleText = TextStyle(
    color: Color.fromRGBO(0, 0, 0, 0.9),
    fontFamily: 'NotoSans',
    fontSize: 26,
    height: 1,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.bold,
  );

  static const cardDescriptionText = TextStyle(
    color: Color.fromRGBO(0, 0, 0, 0.9),
    fontFamily: 'NotoSans',
    fontSize: 16,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.normal,
  );
}
