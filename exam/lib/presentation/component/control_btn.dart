import 'package:exam/theme/dimens.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ControlBtn extends StatelessWidget {
  final Function call;
  final Widget child;

  const ControlBtn({Key? key, required this.call, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        minHeight: heightButton,
      ),
      padding: const EdgeInsets.all(paddingLarge),
      color: Colors.white,
      child: InkWell(
          onTap: () => call(),
          child: child),
    );
  }
}
