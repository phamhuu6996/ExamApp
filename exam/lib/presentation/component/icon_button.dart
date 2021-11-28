import 'package:exam/theme/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CIconButton extends StatelessWidget {
  final Widget icon;
  final Function function;
  final EdgeInsets edgeInsets;
  final Color? color;
  final double? size;

  const CIconButton(
      {Key? key,
        required this.icon,
        required this.function,
        this.edgeInsets: const EdgeInsets.all(0.0),
        this.color,
        this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: edgeInsets,
      icon: icon,
      color: color ?? secondaryColor,
      iconSize: size ?? heightButton/2,
      onPressed: () => function(),
    );
  }
}
