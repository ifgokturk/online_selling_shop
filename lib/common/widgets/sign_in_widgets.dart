import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'text_widgets.dart';
import 'package:online_selling_shop/common/utils/app_colors.dart';


AppBar buildAppBar ({String title=""}){
  return AppBar(
    bottom: PreferredSize(
      preferredSize: const Size.fromHeight(1),
      child: Container(
        color: Colors.red,
        height: 1,
      )
      ,
    ),
    title: Text16Normal(text: title,color: AppColors.primaryText),
  );
}