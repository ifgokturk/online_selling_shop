import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget appImage({
  String imagePath = "assets/icons/user.png",
  double height = 16,
  double width = 16,
}) {
  return Image.asset(
    imagePath.isEmpty ? "assets/icons/user.png" : imagePath ,
    width: width.w,
    height: height.h,
  );
}
