import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:exam/data/datasource/auth/remote/remote.dart';
import 'package:exam/data/datasource/exam/remote/remote.dart';
import 'package:exam/data/datasource/user_profile/remote/profire_fire_remote.dart';
import 'package:exam/data/datasource/user_profile/remote/remote.dart';
import 'package:exam/data/datasource/work_exam/remote/remote.dart';
import 'package:exam/data/datasource/work_exam/remote/work_exam_fire_remote.dart';
import 'package:exam/data/repositories/auth/auth_repo.dart';
import 'package:exam/data/repositories/exam/exam_repo.dart';
import 'package:exam/data/repositories/exam/work_exam_repo.dart';
import 'package:exam/data/repositories/profile/profile_repo.dart';
import 'package:exam/domain/repositories/auth/auth_repo.dart';
import 'package:exam/domain/repositories/exam/exam_repo.dart';
import 'package:exam/domain/repositories/exam/work_exam_repo.dart';
import 'package:exam/domain/repositories/profile/profile_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> configureDependencies() async {
  getIt.registerSingleton<FirebaseAuth>(FirebaseAuth.instance);
  getIt.registerSingleton<FirebaseFirestore>(FirebaseFirestore.instance);
  getIt.registerFactory<AuthRemote>(() => AuthPhoneRemote(getIt<FirebaseAuth>()));
  getIt.registerFactory<AuthRepo>(() => AuthRepoImpl(getIt<AuthRemote>()));
  getIt.registerFactory<ProfileRemote>(() => ProfileFireRemote(getIt<FirebaseFirestore>()));
  getIt.registerFactory<ProfileRepo>(() => ProfileRepoImpl(getIt<ProfileRemote>()));
  getIt.registerFactory<ExamRemote>(() => ExamFireRemote(getIt<FirebaseFirestore>()));
  getIt.registerFactory<ExamRepo>(() => ExamRepoImpl(getIt<ExamRemote>()));
  getIt.registerFactory<WorkExamRemote>(() => WorkExamFireRemote(getIt<FirebaseFirestore>()));
  getIt.registerFactory<WorkExamRepo>(() => WorkExamRepoImpl(getIt<WorkExamRemote>()));
}
