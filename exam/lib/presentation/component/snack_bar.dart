import 'package:exam/theme/theme.dart';
import 'package:flutter/material.dart';

class CSnackBar {
  final Key key;
  final String content;
  final BuildContext context;

  const CSnackBar({required this.key, required this.content, required this.context});

  void showSnackBar() {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    final snackBar = SnackBar(
        key: key,
        content: Text(content, style: contentStyle.copyWith(color: secondaryColor)),
        action: SnackBarAction(label: 'OK', onPressed: () {}),
        duration: const Duration(seconds: 10));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
