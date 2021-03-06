import 'package:exam/app/const.dart';
import 'package:exam/presentation/component/components.dart';
import 'package:exam/presentation/cubit/exam/exam.dart';
import 'package:exam/presentation/view/page/base_page.dart';
import 'package:exam/route/route_name.dart';
import 'package:exam/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdminExamPage extends BasePage {
  const AdminExamPage({Key? key}) : super(key: key, title: 'Exam');

  @override
  State<StatefulWidget> createState() {
    return _AdminExamPageState();
  }
}

class _AdminExamPageState extends BaseStatePage<AdminExamPage> {
  late ExamCubit examCubit;

  void getExam() {
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      examCubit.getExam(userRole);
    });
  }

  @override
  void initState() {
    super.initState();
    examCubit = BlocProvider.of<ExamCubit>(context);
    getExam();
  }

  @override
  Widget build(BuildContext context) {
    body = BlocConsumer<ExamCubit, ExamState>(builder: (context, state) {
      if (state.isLoading) {
        return const Center(child: CircularProgressIndicator());
      }
      if (state.dataExam.isNotEmpty) {
        return Container(
            padding: const EdgeInsets.symmetric(horizontal: paddingLarge, vertical: paddingLarge*2),
            child: ListView.builder(
                itemCount: state.dataExam.length,
                itemBuilder: (context, index) {
                  return UserExamItem(exam: state.dataExam[index].exam, itemClick: (){
                    Navigator.of(context).pushNamed(detailResultExamRoute, arguments: state.dataExam[index]);
                  });
                }));
      } else {
        return Container();
      }
    }, listener: (context, state) {
      if (state.error.isNotEmpty) showSnackBar(state.error);
    });
    return super.build(context);
  }
}
