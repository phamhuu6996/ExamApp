import 'package:exam/app/const.dart';
import 'package:exam/presentation/component/components.dart';
import 'package:exam/presentation/cubit/admin_exam/admin_exam.dart';
import 'package:exam/presentation/view/page/base_page.dart';
import 'package:exam/theme/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdminExamPage extends BasePage {
  const AdminExamPage({Key? key}) : super(key: key, title: 'Admin');

  @override
  State<StatefulWidget> createState() {
    return _AdminExamPageState();
  }
}

class _AdminExamPageState extends BaseStatePage<AdminExamPage> {
  late AdminExamCubit adminExamCubit;

  void getExam() {
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      adminExamCubit.getExam(adminRole);
    });
  }

  void publish(AdminExamState state) {
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      adminExamCubit.publishExam(state.dataExam[0].id, {'pushed': true});
    });
  }

  @override
  void initState() {
    super.initState();
    adminExamCubit = BlocProvider.of<AdminExamCubit>(context);
    getExam();
  }

  @override
  Widget build(BuildContext context) {
    body = BlocConsumer<AdminExamCubit, AdminExamState>(builder: (context, state) {
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
