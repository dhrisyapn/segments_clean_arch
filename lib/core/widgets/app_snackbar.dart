import 'package:flutter/material.dart';
import 'package:segments_clean_arch/core/utils/app_keys.dart';

class AppSnackBar {
  AppSnackBar._();

  static void show(
    String message, {
    Color backgroundColor = Colors.red,
    Duration duration = const Duration(seconds: 3),
    SnackBarBehavior behavior = SnackBarBehavior.floating,
    EdgeInsetsGeometry? margin,
    TextStyle? textStyle,
  }) {
    final snack = SnackBar(
      content: Text(
        message,
        textAlign: TextAlign.center,
        style: textStyle ?? const TextStyle(color: Colors.white, fontSize: 14),
      ),
      backgroundColor: backgroundColor,
      duration: duration,
      elevation: 1,
      margin: margin ?? const EdgeInsets.all(16.0),
      behavior: behavior,
      dismissDirection: DismissDirection.horizontal,
    );

    scaffoldMessengerKey.currentState?.showSnackBar(snack);
  }
}
