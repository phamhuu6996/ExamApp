import 'package:exam/data/model/exam/push_exam.dart';
import 'package:exam/theme/theme.dart';
import 'package:flutter/material.dart';

class ResultExamItem extends StatelessWidget {
  final PushExam exam;

  const ResultExamItem({Key? key, required this.exam}) : super(key: key);

  Widget getBody() {
    return getContent();
  }

  Widget getContent() {
    return Container(
        padding: const EdgeInsets.only(left: paddingLarge),
        alignment: Alignment.centerLeft,
        child: Column(
            children: [
              Text(exam.userName, style: titleStyle.copyWith(color: Colors.white)),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Tổng số câu: ${exam.questions.length}', style: contentStyle.copyWith(color: Colors.white)),
                  Text('Số điểm: ${exam.score}', style: contentStyle.copyWith(color: Colors.white)),
                ],
              )
            ]
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      color: const Color(0xff252121),
      margin: const EdgeInsets.only(bottom: paddingLarge),
      child: Row(
        children: [
          Container(width: 8, color: const Color(0xff2138AB)),
          Expanded(child: getBody()),
        ],
      ),
    );
  }
}