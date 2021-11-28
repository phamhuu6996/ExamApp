import 'package:exam/route/route_name.dart';
import 'package:exam/route/router.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'data/repositories/auth/auth_repo.dart';
import 'di/di.dart';
import 'presentation/cubit/auth/auth_cubit.dart';
import 'theme/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [BlocProvider<AuthCubit>(create: (_) => AuthFirebasePhoneCubit(getIt<AuthPhoneRepo>()))],
        child: MaterialApp(
          theme: theme,
          onGenerateRoute: AppRouter.generateRoute,
          initialRoute: rootRoute,
          builder: (context, child) {
            return MediaQuery(
              child: child!,
              data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            );
          },
          debugShowCheckedModeBanner: false,
        ));
  }
}
