import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CFlatButton extends StatelessWidget {
  final Widget child;
  final Function function;
  final EdgeInsets padding;
  final MaterialStateProperty<Color>? overlayColor;

  const CFlatButton(
      {Key? key,
      required this.function,
      this.padding: const EdgeInsets.all(0.0),
      required this.child,
      this.overlayColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        child: child,
        onPressed: () => function(),
        style: ButtonStyle(
          overlayColor: overlayColor == null ? MaterialStateProperty.all(const Color(0xffe0e0e0)) : overlayColor!,
          shape: MaterialStateProperty.all(const StadiumBorder()),
          padding: MaterialStateProperty.all(padding),
        ));
  }
}
