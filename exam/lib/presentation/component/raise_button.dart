import 'package:exam/theme/color.dart';
import 'package:exam/theme/theme.dart';
import 'package:flutter/material.dart';

class CRaiseButton extends StatelessWidget {
  final String text;
  final Function function;
  final double? width;
  final double? height;
  final bool shape;
  final double? padding;
  final Color background;
  final double? size;
  final Color color;
  final MaterialStateProperty<Color>? overlayColor;

 const CRaiseButton(
      {required this.text,
      required this.function,
      this.width,
      this.height,
      this.shape: true,
      this.padding,
      this.background: primaryColor,
      this.size,
      this.color: secondaryColor,
      this.overlayColor,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? heightButton,
      constraints: const BoxConstraints(minWidth: heightButton * 2),
      padding: EdgeInsets.all(padding ?? 0),
      child: ElevatedButton(
        child: Center(child: Text(text, style: titleStyle.copyWith(color: color))),
        onPressed: () => function(),
        style: ButtonStyle(
            overlayColor: overlayColor == null ? MaterialStateProperty.all(const Color(0xffe0e0e0)) : overlayColor!,
            backgroundColor: MaterialStateProperty.all(background),
            shape: MaterialStateProperty.all(
                shape ? RoundedRectangleBorder(borderRadius:BorderRadius.circular(radius)) : null),
            padding: MaterialStateProperty.all(const EdgeInsets.all(0))),
      ),
    );
  }
}
