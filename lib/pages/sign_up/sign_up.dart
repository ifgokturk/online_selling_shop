import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_selling_shop/common/widgets/app_bar.dart';
import 'package:online_selling_shop/common/widgets/buttons_widgets.dart';
import 'package:online_selling_shop/common/widgets/text_widgets.dart';
import '../../common/widgets/app_textfields.dart';
import '../sign_in/widgets/sign_in_widgets.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
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
              ),
              SizedBox(
                height: 25.h,
              ),
              appTextField(
                text: "Email",
                iconName: "assets/icons/user.png",
                hintText: "Enter Your Email",
                obsecureText: false,
              ),
              SizedBox(
                height: 25.h,
              ),
              appTextField(
                text: "Password",
                iconName: "assets/icons/lock.png",
                hintText: "Enter Your Password",
                obsecureText: true,
              ),
              SizedBox(
                height: 15.h,
              ),
              appTextField(
                text: "Confirm Password",
                iconName: "assets/icons/lock.png",
                hintText: "Enter Your Password",
                obsecureText: true,
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
