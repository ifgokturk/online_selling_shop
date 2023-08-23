import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'app_shadow.dart';
import 'text_widgets.dart';
import 'package:online_selling_shop/common/utils/app_colors.dart';

Widget appButton(
    {double width = 325,
    double height = 50,
    String buttonName = "",
    bool isLogin = true}) {
  return GestureDetector(
    onTap: () {},
    child: Container(
      width: width.w,
      height: height.h,
      decoration: appBoxShadow(
        color: isLogin ? AppColors.primaryElement : Colors.white,
        border: Border.all(
          color: AppColors.primaryFourElementText,
        ),
      ),
      child: Center(
        child: text16Normal(
          text: buttonName,
          color: isLogin ? AppColors.primaryElement : Colors.pink,
        ),
      ),
    ),
  );
}
