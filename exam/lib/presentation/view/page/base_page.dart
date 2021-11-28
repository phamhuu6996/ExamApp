import 'dart:io';

import 'package:exam/presentation/component/components.dart';
import 'package:exam/presentation/component/logout.dart';
import 'package:exam/theme/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BasePage extends StatefulWidget {
  final String? title;
  final bool isKeepState;
  final bool isSubscribe;

  const BasePage({Key? key, this.title, this.isKeepState: false, this.isSubscribe: false}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return BaseStatePage();
  }
}

class BaseStatePage<W extends BasePage> extends State<W> with AutomaticKeepAliveClientMixin {
  final bool isAppBar;
  AppBar? appBar;
  Widget? body;
  Widget? bottomNavBar;
  Widget? floatingActionButton;
  FloatingActionButtonLocation? floatingActionButtonLocation;
  Function? onWillPop;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  BaseStatePage({this.isAppBar: true});

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void validateWidget() {
    body = body ?? Container();
    onWillPop = onWillPop ?? Navigator.of(context).pop;
    appBar = (appBar == null && isAppBar)
        ? AppBar(
            backgroundColor: backgroundColor,
            title: Text(widget.title!),
            centerTitle: true,
            leading: IconButton(icon: const Icon(Icons.arrow_back_ios), onPressed: () => onWillPop!()),
            actions: const [LogoutButton()],
          )
        : appBar;
  }

  Future<void> rootPageBack() async {
    if (Platform.isAndroid) await SystemNavigator.pop(animated: true);
  }

  @override
  Widget build(BuildContext context) {
    validateWidget();
    super.build(context);
    return WillPopScope(
        child: Scaffold(
          key: scaffoldKey,
          appBar: isAppBar ? appBar : null,
          body: Container(color: Colors.black, child: Form(key: formKey, child: body!)),
          bottomNavigationBar: bottomNavBar,
          floatingActionButton: floatingActionButton,
          floatingActionButtonLocation: floatingActionButtonLocation,
        ),
        onWillPop: () => onWillPop!());
  }

  void showSnackBar(String message) => CSnackBar(key: UniqueKey(), content: message, context: context)..showSnackBar();

  @override
  bool get wantKeepAlive => widget.isKeepState;
}
