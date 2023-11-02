import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_selling_shop/common/utils/app_colors.dart';
import 'package:online_selling_shop/common/utils/image_res.dart';
import 'package:online_selling_shop/common/widgets/app_shadow.dart';
import 'package:online_selling_shop/common/widgets/app_textfields.dart';
import 'package:online_selling_shop/common/widgets/image_widgets.dart';

Widget searchBar() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      //search text here
      Container(
        width: 280.w,
        height: 40.h,
        decoration: appBoxShadow(
            color: AppColors.primaryBackground,
            boxBorder: Border.all(color: AppColors.primaryFourElementText)),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(left: 17.w),
              child:const AppImage(
                imagePath: ImageRes.searchIcon,
              ),
            ),
            Container(
              width: 240.w,
              height: 40.h,
              child: appTextFieldOnly(width: 240,height: 40, hintText: "Search your course"),
            ),
          ],
        ),
      ),
      //search button
      GestureDetector(
        onTap: (){},
        child: Container(
          padding: EdgeInsets.all(5.w),
          width: 40.w,
          height: 40.h,
          decoration: appBoxShadow(
            boxBorder: Border.all(
              color: AppColors.primaryElement,
            )
          ),
          child: const AppImage(imagePath: ImageRes.searchButton ),
        ),
      ),
    ],
  );
}
