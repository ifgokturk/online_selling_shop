import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_colors.dart';
import '../utils/image_res.dart';

/*Widget appImage({
  String imagePath = ImageRes.defaultImg,
  double height = 16,
  double width = 16,
}) {
  return Image.asset(
    imagePath.isEmpty ? ImageRes.defaultImg : imagePath ,
    width: width.w,
    height: height.h,
  );
}*/

class AppImage extends StatelessWidget {
final  String imagePath ;
 final      double height;
 final double width;

  const AppImage({super.key,
     this.imagePath = ImageRes.defaultImg,
    this.height= 16,
    this.width= 16 ,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      imagePath.isEmpty ? ImageRes.defaultImg : imagePath ,
      width: width.w,
      height: height.h,
    );
  }
}





Widget appImageWithColor({
  String imagePath = ImageRes.defaultImg,
  double height = 16,
  double width = 16,
  Color color= AppColors.primaryElement,
}) {
  return Image.asset(
    imagePath.isEmpty ? ImageRes.defaultImg : imagePath ,
    width: width.w,
    height: height.h,
    color: color,
  );
}