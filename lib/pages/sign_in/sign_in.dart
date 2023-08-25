import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_selling_shop/common/widgets/app_bar.dart';
import 'package:online_selling_shop/common/widgets/buttons_widgets.dart';
import 'package:online_selling_shop/common/widgets/text_widgets.dart';
import 'package:online_selling_shop/pages/sign_in/widgets/sign_in_widgets.dart';
import 'package:online_selling_shop/pages/sign_up/sign_up.dart';

import '../../common/widgets/app_textfields.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

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
              thirdPartyLogin(),
              Center(
                child: text14Normal(text: "Or sign in with your e-mail."),
              ),
              SizedBox(
                height: 60.h,
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
              )),
              SizedBox(
                height: 15.h,
              ),
              Center(
                  child: appButton(
                buttonName: "Register",
                isLogin: false,
                    context: context,
                    function: ()=> Navigator.pushNamed(context, "/register"),
              )),
            ],
          ),
        ),
      ),
    ));
  }
}
