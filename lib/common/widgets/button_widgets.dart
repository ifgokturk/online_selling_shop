import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'app_shadow.dart';
import 'text_widgets.dart';
import 'package:online_selling_shop/common/utils/app_colors.dart';

class AppButton extends StatelessWidget {
  final double width;
  final double height;
  final String buttonName;
  final bool isLogin;
 final BuildContext? context;
final   void Function()? func;
   AppButton(
      {super.key,
      this.width = 325,
      this.height = 50,
      this.buttonName = "",
      this.isLogin = true,
        this.func,
        this.context,
      });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: func,
      child: Container(
        width: width.w,
        height: height.h,
        decoration: appBoxShadow(
          color: isLogin ?
          AppColors.primaryElement

              : Colors.white,
          boxBorder: Border.all(
            color: AppColors.primaryFourElementText,
          ),
        ),
        child: Center(
          child: Text16Normal(
            text: buttonName,
            color: isLogin ? AppColors.primaryBackground : Colors.pink,
          ),
        ),
      ),
    );
  }
}
