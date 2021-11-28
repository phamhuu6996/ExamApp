import 'package:exam/presentation/cubit/auth/auth.dart';
import 'package:exam/route/route_name.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: ()async{
         await BlocProvider.of<AuthCubit>(context).logout();
         Navigator.of(context).pushNamedAndRemoveUntil(rootRoute, (route) => true);

        },
        icon: const Icon(Icons.logout, color: Colors.white));
  }
}
