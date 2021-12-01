import 'package:exam/app/const.dart';
import 'package:exam/app/static.dart';
import 'package:exam/domain/entities/profile/data_profile.dart';
import 'package:exam/domain/entities/profile/profile.dart';
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
  final TextEditingController nameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    homeCubit = BlocProvider.of<HomeCubit>(context);
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      if (user != null) {
        homeCubit.getProfile(user!.uid);
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
      } else if (!state.isCreateInfo) {
        return Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Please input name!", style: contentStyle.copyWith(color: Colors.white)),
              CTextFieldLine(controller: nameController),
              const SizedBox(height: 30),
              CRaiseButton(
                  text: "Commit",
                  function: () => homeCubit.addProfile(
                      DataProfile(key: user!.uid, profile: Profile(role: 'user', name: nameController.text))))
            ],
          ),
        );
      } else if (state.profile != null) {
        profile = state.profile!.profile;
        return Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('You are a ' + state.profile!.profile.name, style: titleStyle.copyWith(color: Colors.white)),
                Text('Your role are ' + state.profile!.profile.role, style: titleStyle.copyWith(color: Colors.white)),
                const SizedBox(height: 50),
                state.profile!.profile.role == adminRole
                    ? Column(
                        children: [
                          CRaiseButton(
                              text: "Publish exam!", function: () => Navigator.of(context).pushNamed(adminExamRoute)),
                          const SizedBox(height: 30),
                          CRaiseButton(
                              text: "Exam result!", function: () => Navigator.of(context).pushNamed(resultExamRoute))
                        ],
                      )
                    : CRaiseButton(
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
