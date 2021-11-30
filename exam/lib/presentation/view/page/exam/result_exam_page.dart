import 'package:exam/app/const.dart';
import 'package:exam/presentation/component/components.dart';
import 'package:exam/presentation/cubit/user_exam/user_exam.dart';
import 'package:exam/presentation/view/page/base_page.dart';
import 'package:exam/route/route_name.dart';
import 'package:exam/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResultExamPage extends BasePage {
  const ResultExamPage({Key? key}) : super(key: key, title: 'Exam');

  @override
  State<StatefulWidget> createState() {
    return _ResultExamPageState();
  }
}

class _ResultExamPageState extends BaseStatePage<ResultExamPage> {
  late UserExamCubit userExamCubit;

  void getExam() {
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      userExamCubit.getExam(userRole);
    });
  }

  @override
  void initState() {
    super.initState();
    userExamCubit = BlocProvider.of<UserExamCubit>(context);
    getExam();
  }

  @override
  Widget build(BuildContext context) {
    body = BlocConsumer<UserExamCubit, UserExamState>(builder: (context, state) {
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
