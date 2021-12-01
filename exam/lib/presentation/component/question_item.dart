import 'dart:async';
import 'package:exam/domain/entities/exam/detail_exam.dart';
import 'package:exam/domain/entities/exam/exam.dart';
import 'package:exam/presentation/component/components.dart';
import 'package:exam/theme/style.dart';
import 'package:flutter/material.dart';

class QuestionItem extends StatefulWidget {
  final Questions questions;
  final DetailQuestion detailQuestion;
  const QuestionItem({Key? key, required this.questions, required this.detailQuestion}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _QuestionItemState();
  }
}

class _QuestionItemState extends State<QuestionItem> {
  StreamController controller = StreamController.broadcast();

  void select(String id){
    controller.sink.add(id);
    widget.detailQuestion.answerId = [id];
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      if(widget.detailQuestion.answerId.isNotEmpty) {
        controller.sink.add(widget.detailQuestion.answerId[0]);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
   return Column(
      children: [
        Center(child: Text(widget.questions.question, style: titleStyle.copyWith(color: Colors.white))),
        SizedBox(height: 30),
        Expanded(child: ListView.builder(
            itemCount: widget.questions.answers.length,
            itemBuilder: (context,index){
              return AnswerItem(answers: widget.questions.answers[index], call: select, stream: controller.stream);
            }))
      ],
    );
  }

  @override
  void dispose() {
   controller.close();
    super.dispose();
  }
}
