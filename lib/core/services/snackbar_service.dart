import 'package:flutter/material.dart';
import 'package:segments_clean_arch/core/widgets/app_snackbar.dart';

class SnackbarService {
  SnackbarService._();

  static void showError(String message) {
    AppSnackBar.show(message, backgroundColor: Colors.red);
  }

  static void showSuccess(String message) {
    AppSnackBar.show(message, backgroundColor: Colors.green);
  }

  static void show(String message, {Color background = Colors.black}) {
    AppSnackBar.show(message, backgroundColor: background);
  }
}
