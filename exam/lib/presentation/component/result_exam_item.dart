import 'package:exam/domain/entities/exam/detail_exam.dart';
import 'package:exam/theme/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResultExamItem extends StatelessWidget {
  final DetailExam exam;

  const ResultExamItem({Key? key, required this.exam}) : super(key: key);

  Widget getBody() {
    return getContent();
  }

  Widget getContent() {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: paddingLarge),
        alignment: Alignment.centerLeft,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Name: ' + exam.userName, style: titleStyle.copyWith(color: Colors.white)),
                  Text('Correct : ${(exam.questions.length / 100 * exam.score).toStringAsFixed(0)}',
                      style: contentStyle.copyWith(color: Colors.white)),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Score: ${exam.score}', style: contentStyle.copyWith(color: Colors.white)),
                  Text('Count: ${exam.questions.length}', style: contentStyle.copyWith(color: Colors.white))
                ],
              )
            ]));
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
