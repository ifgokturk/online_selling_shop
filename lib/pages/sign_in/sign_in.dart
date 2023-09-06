import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_selling_shop/common/global_loader/global_loader.dart';
import 'package:online_selling_shop/common/widgets/app_bar.dart';
import 'package:online_selling_shop/common/widgets/buttons_widgets.dart';
import 'package:online_selling_shop/common/widgets/text_widgets.dart';
import 'package:online_selling_shop/pages/sign_in/notifiers/sign_in_notifier.dart';
import 'package:online_selling_shop/pages/sign_in/sign_in_controller.dart';
import 'package:online_selling_shop/pages/sign_in/widgets/sign_in_widgets.dart';
import 'package:online_selling_shop/pages/sign_up/sign_up.dart';

import '../../common/widgets/app_textfields.dart';

class SignIn extends ConsumerStatefulWidget {
  const SignIn({super.key});

  @override
  ConsumerState<SignIn> createState() => _SignInState();
}

class _SignInState extends ConsumerState<SignIn> {
  late SignInController _controller;

  @override
  void initState() {
    // TODO: implement initState
    _controller = SignInController(ref: ref);
    super.initState();
  }

    @override
  Widget build(BuildContext context) {
    final signInProvider = ref.watch(signInNotifierProvider);
    final loader = ref.watch(appLoaderProvider);
    print(signInProvider.email);
    return Container(
        child: SafeArea(
      child: Scaffold(
        appBar: buildAppBar(title: "Login"),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              thirdPartyLogin(),
              Center(
                child: text14Normal(text: "Or sign in with your e-mail."),
              ),
              SizedBox(
                height: 60.h,
              ),
              appTextField(
                controller: _controller.emailController,
                text: "Email",
                iconName: "assets/icons/user.png",
                hintText: "Enter Your Email",
                obsecureText: false,
                func: (value) => ref
                    .read(signInNotifierProvider.notifier)
                    .onUserEmailChange(value),
              ),
              SizedBox(
                height: 25.h,
              ),
              appTextField(
                controller: _controller.passwordController,
                text: "Password",
                iconName: "assets/icons/lock.png",
                hintText: "Enter Your Password",
                obsecureText: true,
                func: (value) => ref
                    .read(signInNotifierProvider.notifier)
                    .onUserPasswordChange(value),
              ),
              SizedBox(
                height: 15.h,
              ),
              Container(
                margin: EdgeInsets.only(left: 25.w),
                child: textUnderline(text: "Forgot Password?"),
              ),
              SizedBox(
                height: 85.h,
              ),
              Center(
                  child: appButton(
                      buttonName: "Login",
                      function: () => _controller.handleSignIn())),
              SizedBox(
                height: 15.h,
              ),
              Center(
                  child: appButton(
                buttonName: "Register",
                isLogin: false,
                context: context,
                function: () => Navigator.pushNamed(context, "/register"),
              )),
            ],
          ),
        ),
      ),
    ));
  }
}
