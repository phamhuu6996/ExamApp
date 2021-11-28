import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:exam/data/datasource/auth/remote/remote.dart';
import 'package:exam/data/datasource/exam/remote/remote.dart';
import 'package:exam/data/datasource/user_profile/remote/profire_fire_remote.dart';
import 'package:exam/data/datasource/work_exam/remote/work_exam_fire_remote.dart';
import 'package:exam/data/repositories/auth/auth_repo.dart';
import 'package:exam/data/repositories/exam/exam_fire_repo.dart';
import 'package:exam/data/repositories/exam/work_exam_fire_repo.dart';
import 'package:exam/data/repositories/profile/profile_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> configureDependencies() async {
  getIt.registerSingleton<FirebaseAuth>(FirebaseAuth.instance);
  getIt.registerSingleton<FirebaseFirestore>(FirebaseFirestore.instance);
  getIt.registerFactory<AuthPhoneRemote>(() => AuthPhoneRemote(getIt<FirebaseAuth>()));
  getIt.registerFactory<AuthPhoneRepo>(() => AuthPhoneRepo(getIt<AuthPhoneRemote>()));
  getIt.registerFactory<ProfileFireRemote>(() => ProfileFireRemote(getIt<FirebaseFirestore>()));
  getIt.registerFactory<ProfileFireRepo>(() => ProfileFireRepo(getIt<ProfileFireRemote>()));
  getIt.registerFactory<ExamFireRemote>(() => ExamFireRemote(getIt<FirebaseFirestore>()));
  getIt.registerFactory<ExamFireRepo>(() => ExamFireRepo(getIt<ExamFireRemote>()));
  getIt.registerFactory<WorkExamFireRemote>(() => WorkExamFireRemote(getIt<FirebaseFirestore>()));
  getIt.registerFactory<WorkExamFireRepo>(() => WorkExamFireRepo(getIt<WorkExamFireRemote>()));
}
