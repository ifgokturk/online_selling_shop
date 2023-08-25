import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_selling_shop/common/widgets/app_bar.dart';
import 'package:online_selling_shop/common/widgets/buttons_widgets.dart';
import 'package:online_selling_shop/common/widgets/text_widgets.dart';
import 'package:online_selling_shop/pages/sign_up/notifiers/register_notifier.dart';
import '../../common/widgets/app_textfields.dart';
import '../sign_in/widgets/sign_in_widgets.dart';

class SignUp extends ConsumerStatefulWidget {
  const SignUp({super.key});

  @override
  ConsumerState<SignUp> createState() => _SignUpState();
}

class _SignUpState extends ConsumerState<SignUp> {
  @override
  Widget build(BuildContext context) {

    final regProvider = ref.watch(registerNotifierProvider);

    return Container(
        child: SafeArea(
      child: Scaffold(
        appBar: buildAppBar(),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20.h,
              ),
              Center(
                child: text14Normal(
                    text: "Enter your details below & free sign up"),
              ),
              SizedBox(
                height: 60.h,
              ),
              appTextField(
                text: "User name",
                iconName: "assets/icons/user.png",
                hintText: "Enter Your User Name",
                obsecureText: false,
    func: (value) =>
    ref.read(registerNotifierProvider.notifier).onUserNameChange(value)
    ,
              ),
              SizedBox(
                height: 25.h,
              ),
              appTextField(
                text: "Email",
                iconName: "assets/icons/user.png",
                hintText: "Enter Your Email",
                obsecureText: false,
                func: (value)=> ref.read(registerNotifierProvider.notifier).onUserNameChange(value),
              ),
              SizedBox(
                height: 25.h,
              ),
              appTextField(
                text: "Password",
                iconName: "assets/icons/lock.png",
                hintText: "Enter Your Password",
                obsecureText: true, func: (value) {
    print(value);
    },
              ),
              SizedBox(
                height: 15.h,
              ),
              appTextField(
                text: "Confirm Password",
                iconName: "assets/icons/lock.png",
                hintText: "Enter Your Password",
                obsecureText: true, func: (value) {
    print(value);
    },
              ),
              SizedBox(
                height: 15.h,
              ),
              Container(
                margin: EdgeInsets.only(left: 25.w),
                child: text14Normal(
                    text:
                        "By creating an account, you are agreeing with our terms and conditions"),
              ),
              SizedBox(
                height: 85.h,
              ),
              Center(
                  child: appButton(
                buttonName: "Sign Up",
              )),
            ],
          ),
        ),
      ),
    ));
  }
}
