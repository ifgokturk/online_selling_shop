import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'app_shadow.dart';
import 'text_widgets.dart';
import 'package:online_selling_shop/common/utils/app_colors.dart';


AppBar buildAppBar (){
  return AppBar(
    bottom: PreferredSize(
      preferredSize: const Size.fromHeight(1),
      child: Container(
        color: Colors.red,
        height: 1,
      )
      ,
    ),
    title: text16Normal(text: "Login",color: AppColors.primaryText),
  );
}