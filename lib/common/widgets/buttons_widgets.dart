import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_selling_shop/common/utils/app_colors.dart';
import 'package:online_selling_shop/common/widgets/app_shadow.dart';
import 'package:online_selling_shop/common/widgets/text_widgets.dart';

Widget appButton({
  double width = 325,
  double height = 50,
  String buttonName = "",
  bool isLogin = true,
  BuildContext? context,
  void Function()? function,
}) {
  return GestureDetector(
    onTap: () {
      if (function == null) {
        debugPrint("This handler $buttonName is Null!");
      } else {
        function();
      }
    },
    child: Container(
      width: width.w,
      height: height.h,
      decoration: appBoxShadow(
        color: isLogin ? AppColors.primaryElement : Colors.white,
        boxBorder: Border.all(),
      ),
      child: Center(
        child: Text16Normal(
          text: buttonName,
          color: isLogin ? AppColors.primaryBackground : AppColors.primaryText,
        ),
      ),
    ),
  );
}
