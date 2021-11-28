import 'dart:async';

import 'package:exam/data/model/exam/exam.dart';
import 'package:exam/data/model/exam/push_exam.dart';
import 'package:exam/presentation/component/components.dart';
import 'package:flutter/material.dart';

class QuestionItem extends StatefulWidget {
  final Questions questions;
  final PushQuestion pushQuestion;
  const QuestionItem({Key? key, required this.questions, required this.pushQuestion}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _QuestionItemState();
  }
}

class _QuestionItemState extends State<QuestionItem> {
  StreamController controller = StreamController.broadcast();

  void select(String id){
    controller.sink.add(id);
    widget.pushQuestion.answerId = [id];
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      if(widget.pushQuestion.answerId.isNotEmpty) {
        controller.sink.add(widget.pushQuestion.answerId[0]);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
   return Column(
      children: [
        Center(child: Text(widget.questions.question)),
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
