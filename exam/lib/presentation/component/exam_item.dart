import 'package:exam/data/model/exam/exam.dart';
import 'package:exam/presentation/component/components.dart';
import 'package:exam/theme/dimens.dart';
import 'package:exam/theme/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExamItem extends StatelessWidget {
  final Exam exam;

  const ExamItem({Key? key, required this.exam}) : super(key: key);

  Widget getBody() {
    return Container();
  }

  Widget getContent() {
    return Container(
        padding: const EdgeInsets.only(left: paddingLarge),
        alignment: Alignment.centerLeft,
        child: Text(exam.title, style: titleStyle.copyWith(color: Colors.white)));
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

class AdminExamItem extends ExamItem {
  final Function publish;

  const AdminExamItem({required this.publish, required Exam exam, Key? key}) : super(key: key, exam: exam);

  @override
  Widget getBody() {
    return Stack(
      children: [
        getContent(),
        Positioned(
            right: padding, bottom: padding, child: CIconButton(icon: const Icon(Icons.publish), function: publish))
      ],
    );
  }
}

class UserExamItem extends ExamItem {
  final Function itemClick;

  const UserExamItem({required this.itemClick, required Exam exam, Key? key}) : super(key: key, exam: exam);

  @override
  Widget getBody() {
    return InkWell(onTap: () => itemClick(), child: getContent());
  }
}
