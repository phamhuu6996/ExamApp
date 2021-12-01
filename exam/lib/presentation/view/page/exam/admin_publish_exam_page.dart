import 'package:exam/app/const.dart';
import 'package:exam/presentation/component/components.dart';
import 'package:exam/presentation/cubit/exam/exam.dart';
import 'package:exam/presentation/view/page/base_page.dart';
import 'package:exam/theme/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdminPublishExamPage extends BasePage {
  const AdminPublishExamPage({Key? key}) : super(key: key, title: 'Admin');

  @override
  State<StatefulWidget> createState() {
    return _AdminPublishExamPageState();
  }
}

class _AdminPublishExamPageState extends BaseStatePage<AdminPublishExamPage> {
  late ExamCubit examCubit;

  void getExam() {
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      examCubit.getExam(adminRole);
    });
  }

  void publish(ExamState state) {
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      examCubit.publishExam(state.dataExam[0].id, {'pushed': true});
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
                  return AdminExamItem(exam: state.dataExam[index].exam, publish: () => publish(state));
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
