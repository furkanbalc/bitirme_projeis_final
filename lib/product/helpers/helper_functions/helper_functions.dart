import 'package:flutter/material.dart';

class HelperFunctions {
  static String truncateText(String text, int maxLenght) {
    return text.length <= maxLenght ? text : text.substring(0, maxLenght);
  }

  static void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }
}
