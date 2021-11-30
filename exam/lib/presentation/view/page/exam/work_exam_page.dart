import 'dart:async';
import 'package:exam/data/model/exam/data_exam.dart';
import 'package:exam/data/model/exam/push_exam.dart';
import 'package:exam/presentation/component/components.dart';
import 'package:exam/presentation/cubit/work_exam/work_exam.dart';
import 'package:exam/presentation/view/page/base_page.dart';
import 'package:exam/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WorkExamPage extends BasePage {
  final DataExam dataExam;

  const WorkExamPage({Key? key, required this.dataExam}) : super(key: key, title: 'Exam');

  @override
  State<StatefulWidget> createState() {
    return _WorkExamPageState();
  }
}

class _WorkExamPageState extends BaseStatePage<WorkExamPage> {
  late WorkExamCubit workExamCubit;
  final StreamController streamTab = StreamController.broadcast();
  final PageController pageController = PageController();
  List<Widget> childrenTab = [];
  List<Widget> children = [];
  int index = 0;
  late PushExam pushExam;

  @override
  void initState() {
    super.initState();
    workExamCubit = BlocProvider.of<WorkExamCubit>(context);
    pushExam = workExamCubit.initPushExam(widget.dataExam);
  }

  void onPageChange(int index) {
    this.index = index;
    streamTab.sink.add(index);
  }

  void setChildren() {
    childrenTab.clear();
    children.clear();
    for (int i = 0; i < widget.dataExam.exam.questions.length; i++) {
      childrenTab.add(Expanded(
          child: StreamBuilder(
        stream: streamTab.stream,
        builder: (context, snapshot) {
          return Container(
              height: 5,
              margin: const EdgeInsets.symmetric(horizontal: 2),
              color: i == index ? Colors.white : Colors.grey);
        },
      )));
      children.add(QuestionItem(questions: widget.dataExam.exam.questions[i], pushQuestion: pushExam.questions[i]));
    }
  }

  @override
  Widget build(BuildContext context) {
    setChildren();
    body = BlocConsumer<WorkExamCubit, WorkExamState>(builder: (context, state) {
      if (state.isLoading) {
        return const Center(child: CircularProgressIndicator());
      } else {
        return Container(
          child: Column(
            children: [
              Expanded(
                  child: Container(
                      padding: const EdgeInsets.all(paddingLarge),
                      child: Column(
                        children: [
                          Container(
                            child: Row(children: childrenTab),
                          ),
                          SizedBox(height: 30),
                          Expanded(
                              child: PageView(
                                  controller: pageController,
                                  children: children,
                                  onPageChanged: (int index) => onPageChange(index)))
                        ],
                      ))),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child: StreamBuilder(
                          stream: streamTab.stream,
                          builder: (context, snapshot) {
                            if (index > 0) {
                              return ControlBtn(
                                  call: () => pageController.previousPage(
                                      duration: const Duration(milliseconds: 200), curve: Curves.ease),
                                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                                    const Icon(Icons.arrow_back_outlined, color: Colors.black),
                                    Text('Previous', style: titleStyle.copyWith(color: Colors.black))
                                  ]));
                            } else {
                              return Container();
                            }
                          })),
                  const SizedBox(width: 80),
                  Expanded(
                      child: ControlBtn(
                          call: () {
                            if (index < children.length - 1) {
                              pageController.nextPage(duration: const Duration(milliseconds: 200), curve: Curves.ease);
                            } else {
                              workExamCubit.push(pushExam);
                            }
                          },
                          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                            Text('Next', style: titleStyle.copyWith(color: Colors.black)),
                            const Icon(Icons.arrow_forward_outlined, color: Colors.black)
                          ])))
                ],
              )
            ],
          ),
        );
      }
    }, listener: (context, state) {
      if (state.error.isNotEmpty) {
        showSnackBar(state.error);
      } else if(state.isPublish) {
        showSnackBar('Push exam success');
        Navigator.of(context).pop();
      }
    });
    return super.build(context);
  }

  @override
  void dispose() {
    streamTab.close();
    super.dispose();
  }
}
