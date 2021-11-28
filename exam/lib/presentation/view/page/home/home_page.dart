import 'package:exam/app/const.dart';
import 'package:exam/data/model/profile/profile.dart';
import 'package:exam/data/repositories/auth/auth_repo.dart';
import 'package:exam/domain/param/param.dart';
import 'package:exam/presentation/component/components.dart';
import 'package:exam/presentation/component/logout.dart';
import 'package:exam/presentation/cubit/home/home.dart';
import 'package:exam/presentation/view/page/base_page.dart';
import 'package:exam/route/route_name.dart';
import 'package:exam/theme/style.dart';
import 'package:exam/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends BasePage {
  const HomePage({Key? key}) : super(key: key, title: 'Home');

  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends BaseStatePage<HomePage> {
  late HomeCubit homeCubit;

  @override
  void initState() {
    super.initState();
    homeCubit = BlocProvider.of<HomeCubit>(context);
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      if (user != null) {
        homeCubit.getProfile(ProfileParam(key: user!.uid, value: const Profile(role: 'user', name: 'user')));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    onWillPop = rootPageBack;
    appBar = AppBar(
      backgroundColor: backgroundColor,
      automaticallyImplyLeading: false,
      title: Text(widget.title!),
      centerTitle: true,
      actions: const [LogoutButton()],
    );
    body = BlocConsumer<HomeCubit, HomeState>(builder: (context, state) {
      if (state.isLoading) {
        return const Center(child: CircularProgressIndicator());
      } else if (state.profile != null) {
        return Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('You are a ' + state.profile!.profile.name, style: titleStyle.copyWith(color: Colors.white)),
                const SizedBox(height: 50),
                CRaiseButton(
                    text: "Start now!",
                    function: () => Navigator.of(context)
                        .pushNamed(state.profile!.profile.role == adminRole ? adminExamRoute : userExamRoute))
              ],
            ));
      } else {
        return Container();
      }
    }, listener: (context, state) {
      if (state.error.isNotEmpty) showSnackBar(state.error);
    });
    return super.build(context);
  }
}
