import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_selling_shop/common/global_loader/global_loader.dart';
import 'package:online_selling_shop/common/widgets/app_bar.dart';
import 'package:online_selling_shop/common/widgets/buttons_widgets.dart';
import 'package:online_selling_shop/common/widgets/text_widgets.dart';

import 'package:online_selling_shop/features/sign_up/controller/sign_up_controller.dart';
import '../../../common/utils/image_res.dart';
import '../../../common/widgets/app_textfields.dart';

import '../provider/register_notifier.dart';

class SignUp extends ConsumerStatefulWidget {
  const SignUp({super.key});

  @override
  ConsumerState<SignUp> createState() => _SignUpState();
}

class _SignUpState extends ConsumerState<SignUp> {
  late SignUpController _controller;

  @override
  void initState() {
    _controller = SignUpController(ref: ref);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //  final regProvider = ref.watch(registerNotifierProvider);
    final regProvider = ref.watch(registerNotifierProvider);
    final loader = ref.watch(appLoaderProvider);
    return Container(
        child: SafeArea(
      child: Scaffold(
        appBar: buildAppBar(title: "SignUp"),
        backgroundColor: Colors.white,
        body: loader == false
            ? SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20.h,
                    ),
                    const Center(
                      child: Text14Normal(
                          text: "Enter your details below & free sign up"),
                    ),
                    SizedBox(
                      height: 60.h,
                    ),
                    appTextField(
                      text: "User name",
                      iconName: ImageRes.user,
                      hintText: "Enter Your User Name",
                      obsecureText: false,
                      func: (value) => ref
                          .read(registerNotifierProvider.notifier)
                          .onUserNameChange(value),
                    ),
                    SizedBox(
                      height: 25.h,
                    ),
                    appTextField(
                      text: "Email",
                      iconName: ImageRes.email,
                      hintText: "Enter Your Email",
                      obsecureText: false,
                      func: (value) => ref
                          .read(registerNotifierProvider.notifier)
                          .onUserEmailChange(value),
                    ),
                    SizedBox(
                      height: 25.h,
                    ),
                    appTextField(
                      text: "Password",
                      iconName: ImageRes.lock,
                      hintText: "Enter Your Password",
                      obsecureText: true,
                      func: (value) => ref
                          .read(registerNotifierProvider.notifier)
                          .onUserPasswordChange(value),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    appTextField(
                      text: "Confirm Password",
                      iconName: ImageRes.lock,
                      hintText: "Enter Your Password",
                      obsecureText: true,
                      func: (value) => ref
                          .read(registerNotifierProvider.notifier)
                          .onUserConfirmPasswordChange(value),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 25.w),
                      child: const Text14Normal(
                          text:
                              "By creating an account, you are agreeing with our terms and conditions"),
                    ),
                    SizedBox(
                      height: 85.h,
                    ),
                    Center(
                        child: appButton(
                      buttonName: "Sign Up",
                      isLogin: true,
                      context: context,
                      function: () => _controller.handleSignUp(),
                    )),
                  ],
                ),
              )
            : const Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.orange,
                ),
              ),
      ),
    ));
  }
}
