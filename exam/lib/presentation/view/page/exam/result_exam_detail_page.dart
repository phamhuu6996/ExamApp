import 'package:exam/data/model/exam/data_exam.dart';
import 'package:exam/presentation/component/components.dart';
import 'package:exam/presentation/cubit/result_exam/result_exam.dart';
import 'package:exam/presentation/view/page/base_page.dart';
import 'package:exam/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailResultExamPage extends BasePage {
  final DataExam exam;
  const DetailResultExamPage({Key? key, required this.exam}) : super(key: key, title: 'Exam');

  @override
  State<StatefulWidget> createState() {
    return _DetailResultExamPageState();
  }
}

class _DetailResultExamPageState extends BaseStatePage<DetailResultExamPage> {
  late ResultExamCubit resultExamCubit;

  void getExam() {
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      resultExamCubit.getExams('exam_id', widget.exam.id);
    });
  }

  @override
  void initState() {
    super.initState();
    resultExamCubit = BlocProvider.of<ResultExamCubit>(context);
    getExam();
  }

  @override
  Widget build(BuildContext context) {
    body = BlocConsumer<ResultExamCubit, ResultExamState>(builder: (context, state) {
      if (state.isLoading) {
        return const Center(child: CircularProgressIndicator());
      }
      if (state.dataExam.isNotEmpty) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Exam name: ' + widget.exam.exam.title, style: titleStyle.copyWith(color: Colors.white)),
            Expanded(child: Container(
                padding: const EdgeInsets.symmetric(horizontal: paddingLarge, vertical: paddingLarge*2),
                child: ListView.builder(
                    itemCount: state.dataExam.length,
                    itemBuilder: (context, index) {
                      return ResultExamItem(exam: state.dataExam[index].pushExam);
                    })))
          ],
        );
      } else {
        return Container();
      }
    }, listener: (context, state) {
      if (state.error.isNotEmpty) showSnackBar(state.error);
    });
    return super.build(context);
  }
}
