import 'package:exam/theme/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CTextFieldLine extends StatelessWidget {
  final TextEditingController controller;
  final Function? onChange;
  final bool isValidate;
  final TextInputType textInputType;
  final TextAlign textAlign;
  final TextStyle? textStyle;
  final String? label;
  final bool isEnable;
  final bool isPass;
  final int maxLine;

  const CTextFieldLine(
      {Key? key,
        required this.controller,
        this.onChange,
        this.isValidate: false,
        this.textInputType: TextInputType.text,
        this.textAlign: TextAlign.left,
        this.textStyle,
        this.label: '',
        this.isEnable: true,
        this.isPass: false,
        this.maxLine: 1,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(0),
        color: isEnable ? null : Colors.white,
        child: Center(
            child: TextFormField(
                enabled: isEnable,
                controller: controller,
                validator: (value) {
                  if (value!.isEmpty && isValidate) {
                    return "Input Empty";
                  }
                  return null;
                },
                keyboardType: textInputType,
                textAlign: textAlign,
                style: titleStyle.copyWith(fontWeight: FontWeight.normal, color: Colors.white),
                obscureText: isPass,
                maxLines: maxLine,
                decoration: InputDecoration(
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)
                    ),
                    enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide( color: primaryColor)
                    ),
                    errorBorder: const UnderlineInputBorder(
                        borderSide: BorderSide( color: primaryColor)),
                    focusedErrorBorder: const UnderlineInputBorder(
                        borderSide: BorderSide( color: primaryColor)),
                    contentPadding: const EdgeInsets.all(0),
                    labelStyle: titleStyle.copyWith( fontWeight: FontWeight.normal, color: Colors.white),
                    labelText: label))));
  }
}
