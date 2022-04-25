import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppHelper {
  static void hideKeyboard(BuildContext context) {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (Platform.isIOS) {
      if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
        FocusManager.instance.primaryFocus!.unfocus();
      }
    } else if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }

  static void popScreen(BuildContext context, int popScreen) {
    int count = 0;
    Navigator.of(context).popUntil((_) => count++ >= popScreen);
  }

  static void changeScreen(BuildContext context, Widget screen) {
    Navigator.of(context).push(
      CupertinoPageRoute<void>(
        builder: (BuildContext context) => screen,
      ),
    );
  }

  static Future<dynamic> changeScreenForResult(
      BuildContext context, Widget screen,
      {bool fullscreenDialog = false}) {
    return Navigator.of(context).push(
      CupertinoPageRoute<void>(
        fullscreenDialog: fullscreenDialog,
        builder: (BuildContext context) => screen,
      ),
    );
  }

  static void changeScreenReplace(BuildContext context, Widget screen) {
    Navigator.of(context).pushReplacement(
      CupertinoPageRoute<void>(
        builder: (BuildContext context) => screen,
      ),
    );
  }

  static void changeScreenClearStack(BuildContext context, Widget screen) {
    Navigator.pushAndRemoveUntil(
      context,
      CupertinoPageRoute(builder: (BuildContext context) => screen),
      (route) => false,
    );
  }

  static void showSnackBar(BuildContext context, String message,
      {Color? color}) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: color,
        content: Text(message),
      ),
    );
  }

  static bool isValidEmail(String email) {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
  }

  static Color getColorFromHex(String hexColor) {
    return Color(
      int.parse((hexColor).replaceAll('#', '0xff')),
    );
  }

  static void showLog(String message) {
    debugPrint(message);
  }
}
