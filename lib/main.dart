import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show DeviceOrientation, SystemChrome;
import 'package:provider/provider.dart';
import 'package:whisky_app/data/app_state.dart';
import 'package:whisky_app/screens/home.dart';
import 'package:whisky_app/styles.dart';

void main() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(WhiskyApp());
}

class WhiskyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _WhiskyAppState createState() => _WhiskyAppState();
}

class _WhiskyAppState extends State<WhiskyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AppState>(
      create: (context) => AppState(),
      child: CupertinoApp(
        debugShowCheckedModeBanner: false,
        color: Styles.appBackground,
        home: HomeScreen(),
      ),
    );
  }
}
