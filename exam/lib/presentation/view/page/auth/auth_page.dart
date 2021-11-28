import 'package:exam/domain/param/param.dart';
import 'package:exam/presentation/component/components.dart';
import 'package:exam/presentation/cubit/auth/auth.dart';
import 'package:exam/route/route_name.dart';
import 'package:exam/theme/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../base_page.dart';

class LoginPage extends BasePage {
  const LoginPage({Key? key}) : super(key: key, title: 'Login');

  @override
  State<StatefulWidget> createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends BaseStatePage<LoginPage> {
  final _phoneController = TextEditingController();
  final _codeController = TextEditingController();
  late AuthCubit _cubit;
  bool isShowing = false;

  _LoginPageState() : super(isAppBar: false);

  void showDialogConfirm(AuthState state) async {
    if (!isShowing) {
      isShowing = true;
      await showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) {
            return AlertDialog(
              backgroundColor: backgroundColor,
              title: Text("Input code?", style: titleStyle),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  CTextFieldLine(controller: _codeController, isValidate: true),
                ],
              ),
              actions: <Widget>[
                CFlatButton(
                    function: () {
                      if (_codeController.text.isNotEmpty) {
                        _cubit.login(AuthPhoneParam(state.dataSend!.id, _codeController.text.trim()));
                        Navigator.of(context).pop();
                      }
                    },
                    child: Text("Confirm", style: titleStyle))
              ],
            );
          });
      isShowing = false;
    }
  }

  @override
  void initState() {
    super.initState();
    _cubit = BlocProvider.of<AuthCubit>(context);
  }

  @override
  Widget build(BuildContext context) {
    onWillPop = rootPageBack;
    body = BlocConsumer<AuthCubit, AuthState>(builder: (context, state) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: paddingLarge),
        alignment: Alignment.center,
        child: SingleChildScrollView(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(alignment: Alignment.bottomLeft, child: Text('Phone', style: contentStyle.copyWith())),
            CTextFieldLine(controller: _phoneController, isValidate: true),
            const SizedBox(height: 20),
            CRaiseButton(
                text: 'Login',
                function: () => (_cubit as AuthFirebasePhoneCubit).sendCode(_phoneController.text),
                background: secondaryColor,
                color: backgroundColor),
            const SizedBox(height: 20),
            state.isLoading ? const CircularProgressIndicator() : Container()
          ],
        )),
      );
    }, listener: (context, state) {
      if (state.isLogged) {
        Navigator.of(context).popAndPushNamed(homeRoute);
      } else if (state.dataSend != null) {
        showDialogConfirm(state);
      } else if (state.error.isNotEmpty) {
        showSnackBar(state.error);
      }
    });

    return super.build(context);
  }
}
