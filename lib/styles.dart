import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

abstract class Styles {
  static const appBackground = Color(0xffd0d0d0);

  static const cardTitleText = TextStyle(
    color: Color.fromRGBO(0, 0, 0, 0.9),
    fontSize: 26,
    height: 1,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.bold,
  );

  static const cardDescriptionText = TextStyle(
    color: Color.fromRGBO(0, 0, 0, 0.9),
    fontSize: 16,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.normal,
  );

  static const detailsTitleText = TextStyle(
    color: Color.fromRGBO(0, 0, 0, 0.9),
    fontSize: 30,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.bold,
  );

  static const detailsDescriptionText = TextStyle(
    color: Color.fromRGBO(0, 0, 0, 0.9),
    fontSize: 16,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.normal,
  );

  static const detailsCategoryText = TextStyle(
    color: Color.fromRGBO(0, 0, 0, 0.7),
    fontSize: 16,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.normal,
  );

  static const detailsTableHeaderText = TextStyle(
    color: Color.fromRGBO(176, 176, 176, 1),
    fontSize: 16,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.bold,
  );

  static const detailsTableLabelText = TextStyle(
    color: Color.fromRGBO(0, 0, 0, 0.9),
    fontSize: 16,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.bold,
  );

  static const detailsTableValueText = TextStyle(
    color: Color.fromRGBO(0, 0, 0, 0.9),
    fontSize: 16,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.normal,
  );

  static const detailsTableNoteText = TextStyle(
    color: Color.fromRGBO(0, 0, 0, 0.9),
    fontSize: 16,
    fontStyle: FontStyle.italic,
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
    fontSize: 14,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.normal,
  );

  static const Color searchCursorColor = Color.fromRGBO(0, 122, 255, 1);

  static const headlineName = TextStyle(
    color: Color.fromRGBO(0, 0, 0, 0.9),
    fontSize: 20,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.bold,
  );

  static const headlineDescription = TextStyle(
    color: Color.fromRGBO(1, 46, 43, 0.5),
    fontSize: 16,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.normal,
  );

  static const headlineItalicDescription = TextStyle(
    color: Color.fromRGBO(0, 0, 0, 0.8),
    fontSize: 16,
    fontStyle: FontStyle.italic,
    fontWeight: FontWeight.normal,
  );

  static const cardFooterBackground = Color(0xffe0e0e0);

  static const starColor = Color(0xff000000);

  static const starBordered = IconData(
    0xf4b2,
    fontFamily: CupertinoIcons.iconFont,
    fontPackage: CupertinoIcons.iconFontPackage,
  );

  static const star = IconData(
    0xf4b3,
    fontFamily: CupertinoIcons.iconFont,
    fontPackage: CupertinoIcons.iconFontPackage,
  );

  static const buttonColor = Color.fromARGB(255, 0, 122, 255);
  static const buttonGrayColor = Color(0xff808080);

  static const transparentColor = Color(0x00000000);

  static const Color settingsMediumGray = Color(0xffc7c7c7);

  static const Color settingsItemPressed = Color(0xffd9d9d9);

  static const Color settingsLineation = Color(0xffbcbbc1);

  static const Color settingsBackground = Color(0xffefeff4);

  static const Color settingsGroupSubtitle = Color(0xff777777);

  static const infoIcon = IconData(
    0xf445,
    fontFamily: CupertinoIcons.iconFont,
    fontPackage: CupertinoIcons.iconFontPackage,
  );
}
