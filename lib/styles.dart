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

  static const detailsTitleText = TextStyle(
    color: Color.fromRGBO(0, 0, 0, 0.9),
    fontFamily: 'NotoSans',
    fontSize: 30,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.bold,
  );

  static const detailsDescriptionText = TextStyle(
    color: Color.fromRGBO(0, 0, 0, 0.9),
    fontFamily: 'NotoSans',
    fontSize: 16,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.normal,
  );

  static const detailsCategoryText = TextStyle(
    color: Color.fromRGBO(0, 0, 0, 0.7),
    fontFamily: 'NotoSans',
    fontSize: 16,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.normal,
  );

  static const scaffoldBackground = Color(0xfff0f0f0);
  static const frostedBackground = Color(0xccf8f8f8);
  static const closeButtonUnpressed = Color(0xff101010);
  static const closeButtonPressed = Color(0xff808080);

  static const searchBackground = Color(0xffe0e0e0);
  static const Color searchIconColor = Color.fromRGBO(128, 128, 128, 1);
  static const TextStyle searchText = TextStyle(
    color: Color.fromRGBO(0, 0, 0, 1),
    fontFamily: 'NotoSans',
    fontSize: 14,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.normal,
  );

  static const Color searchCursorColor = Color.fromRGBO(0, 122, 255, 1);

  static const headlineName = TextStyle(
    color: Color.fromRGBO(0, 0, 0, 0.9),
    fontFamily: 'NotoSans',
    fontSize: 20,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.bold,
  );

  static const headlineDescription = TextStyle(
    color: Color.fromRGBO(0, 0, 0, 0.8),
    fontFamily: 'NotoSans',
    fontSize: 16,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.normal,
  );
}
