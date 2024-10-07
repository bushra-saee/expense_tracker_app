import 'package:flutter/material.dart';

class Navigation {
  static void push(BuildContext context, Widget screen) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => screen));
  }
}

class PushAndRemove {
  static void pushAndRemove(BuildContext context, Widget screen) {
    Navigator.pushAndRemoveUntil(
      context,MaterialPageRoute(builder: (context) => screen),
      (Route <dynamic> route) => false,
    );
  }
}
