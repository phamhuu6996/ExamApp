import 'package:exam/data/model/exam/data_exam.dart';
import 'package:exam/di/di.dart';
import 'package:exam/domain/repositories/repositories.dart';
import 'package:exam/presentation/cubit/detail_exam/detail_exam.dart';
import 'package:exam/presentation/cubit/exam/exam.dart';
import 'package:exam/presentation/cubit/home/home.dart';
import 'package:exam/presentation/cubit/result_exam/result_exam.dart';
import 'package:exam/presentation/view/page/auth/auth_page.dart';
import 'package:exam/presentation/view/page/exam/exam.dart';
import 'package:exam/presentation/view/page/exam/result_exam_page.dart';
import 'package:exam/presentation/view/page/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'route_name.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case rootRoute:
        return MaterialPageRoute(builder: (_) => const LoginPage(), settings: settings);
      case homeRoute:
        return MaterialPageRoute(
            builder: (_) =>
                BlocProvider<HomeCubit>(create: (context) => HomeCubit(getIt<ProfileRepo>()), child: const HomePage()),
            settings: settings);
      case adminExamRoute:
        return MaterialPageRoute(
            builder: (_) => BlocProvider<ExamCubit>(
                create: (context) => ExamCubit(getIt<ExamRepo>()), child: const AdminExamPage()),
            settings: settings);
      case resultExamRoute:
        return MaterialPageRoute(
            builder: (_) => BlocProvider<ExamCubit>(
                create: (context) => ExamCubit(getIt<ExamRepo>()), child: const AdminExamPage()),
            settings: settings);
      case detailResultExamRoute:
        return MaterialPageRoute(
            builder: (_) => BlocProvider<ResultExamCubit>(
                create: (context) => ResultExamCubit(getIt<WorkExamRepo>()),
                child: ResultExamPage(exam: (settings.arguments)! as DataExam)),
            settings: settings);
      case userExamRoute:
        return MaterialPageRoute(
            builder: (_) => BlocProvider<ExamCubit>(
                create: (context) => ExamCubit(getIt<ExamRepo>()), child: const UserExamPage()),
            settings: settings);
      case detailExamRoute:
        return MaterialPageRoute(
            builder: (_) => BlocProvider<DetailExamCubit>(
                create: (context) => DetailExamCubit(getIt<WorkExamRepo>()),
                child: DetailExamPage(dataExam: (settings.arguments)! as DataExam)),
            settings: settings);
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
