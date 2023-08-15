import 'package:flutter/material.dart';
import 'package:online_selling_shop/common/utils/app_colors.dart';
import 'package:online_selling_shop/common/widgets/app_shadow.dart';
import 'package:online_selling_shop/common/widgets/text_widgets.dart';

Widget appOnBoardingPage(
    PageController controller,{
  required String imagePath,
  required String title,
  required String subTitle,index=0,
}) {
  return Column(
    children: [
      Image.asset(imagePath, fit: BoxFit.fitWidth),
      Container(
        margin: const EdgeInsets.only(top: 15),
        child: text24Normal(
          text: title,
        ),
      ),
      Container(
        margin: const EdgeInsets.only(top: 15),
        padding: const EdgeInsets.only(left: 30, right: 30),
        child: text16Normal(
          text: subTitle,
        ),
      ),
      _nextButton(index,controller),
    ],
  );
}

Widget _nextButton(index,PageController controller) {
  return GestureDetector(
    onTap: (){
      controller.animateToPage(
          index,
          duration:const  Duration(milliseconds: 200),
          curve: Curves.linear,
      );
      debugPrint(index.toString());
    },
    child: Container(
      width: 325,
      height: 50,

      margin: const EdgeInsets.only(
        top: 100,
        left: 25,
        right: 25,
      ),
      decoration: appBoxShadow(

      ),
      child: Center(child: text16Normal(text: "Next",
      color: AppColors.primaryBackground
      ),),
    ),
  );
}
