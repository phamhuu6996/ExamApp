import 'package:exam/data/repositories/exam/exam_fire_repo.dart';
import 'package:exam/data/repositories/exam/work_exam_fire_repo.dart';
import 'package:exam/data/repositories/profile/profile_repo.dart';
import 'package:exam/di/di.dart';
import 'package:exam/domain/entities/entities.dart';
import 'package:exam/presentation/cubit/admin_exam/admin_exam.dart';
import 'package:exam/presentation/cubit/home/home.dart';
import 'package:exam/presentation/cubit/user_exam/user_exam.dart';
import 'package:exam/presentation/cubit/work_exam/work_exam.dart';
import 'package:exam/presentation/view/page/auth/auth_page.dart';
import 'package:exam/presentation/view/page/exam/exam.dart';
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
            builder: (_) => BlocProvider<HomeCubit>(
                create: (context) => HomeCubit(getIt<ProfileFireRepo>()), child: const HomePage()),
            settings: settings);
      case adminExamRoute:
        return MaterialPageRoute(
            builder: (_) => BlocProvider<AdminExamCubit>(
                create: (context) => AdminExamCubit(getIt<ExamFireRepo>()), child: const AdminExamPage()),
            settings: settings);
      case userExamRoute:
        return MaterialPageRoute(
            builder: (_) => BlocProvider<UserExamCubit>(
                create: (context) => UserExamCubit(getIt<ExamFireRepo>()), child: const UserExamPage()),
            settings: settings);
      case detailExamRoute:
        return MaterialPageRoute(
            builder: (_) => BlocProvider<WorkExamCubit>(
                create: (context) => WorkExamCubit(getIt<WorkExamFireRepo>()), child: WorkExamPage(dataExam: (settings.arguments)! as DataExam)),
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
