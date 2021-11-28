import 'package:exam/data/model/exam/exam.dart';
import 'package:exam/theme/dimens.dart';
import 'package:exam/theme/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnswerItem extends StatefulWidget {
  final Answers answers;
  final Function call;
  final Stream stream;

  const AnswerItem({Key? key, required this.answers, required this.call, required this.stream}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _AnswerItemState();
  }
}

class _AnswerItemState extends State<AnswerItem> {

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:()=> widget.call(widget.answers.id),
      child: StreamBuilder(
        stream: widget.stream,
        builder: (context,snapshot){
          String id = snapshot.hasData? snapshot.data as String : '';
          return Container(
            constraints: const BoxConstraints(
                minHeight: 100
            ),
            color: widget.answers.id == id ? const Color(0xff2138AB) : const Color(0xff252121),
            margin: const EdgeInsets.only(bottom: 8),
            child: Row(
              children: [
                const SizedBox(width: paddingLarge),
                widget.answers.id == id
                    ? const Icon(Icons.check_box, color: Colors.white)
                    : const Icon(Icons.check_box_outline_blank_sharp, color: Colors.grey),
                const SizedBox(width: paddingLarge),
                Expanded(
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: Text(widget.answers.value, style: contentStyle.copyWith(color: Colors.white)),
                  ),
                )
              ],
            ),
          );
        },
      )
    );
  }
}
