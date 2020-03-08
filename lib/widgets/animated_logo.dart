import 'package:flutter/cupertino.dart';

class AnimatedLogo extends AnimatedWidget {
  static final _sizeTween = Tween<double>(begin: 40, end: 35);

  AnimatedLogo({Key key, Animation<double> animation})
      : super(key: key, listenable: animation);

  Widget build(BuildContext context) {
    final animation = listenable as Animation<double>;
    return Center(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        height: _sizeTween.evaluate(animation),
        width: _sizeTween.evaluate(animation),
        child: Image(
          image: AssetImage('assets/images/loader.png'),
          width: animation.value,
        ),
      ),
    );
  }
}
