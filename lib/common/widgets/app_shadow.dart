import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_colors.dart';
import '../utils/image_res.dart';

BoxDecoration appBoxShadow({
  Color color = AppColors.primaryElement,
  double radius = 15.0,
  sR = 1.0,
  bR = 2.0,
  BoxBorder? boxBorder,

}) {
  return BoxDecoration(
    color: color,
    borderRadius: BorderRadius.circular(radius),
    border: boxBorder,

    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.7),
        spreadRadius: sR,
        blurRadius: bR,
        offset: const Offset(0, 1),
      ),
    ],
  );
}

BoxDecoration appBoxShadowWithRadius({
  Color color = AppColors.primaryElement,
  double radius = 15.0,
  sR = 1.0,
  bR = 2.0,
  BoxBorder? border,
}) {
  return BoxDecoration(
    color: color,
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(20.h),
      topRight: Radius.circular(20.h),
    ),
    border: border,
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.7),
        spreadRadius: sR,
        blurRadius: bR,
        offset: const Offset(0, 1),
      ),
    ],
  );
}

BoxDecoration appBoxDecorationTextField({
  Color color = AppColors.primaryBackground,
  double radius = 15,
  Color borderColor = AppColors.primaryFourElementText,
}) {
  return BoxDecoration(
    color: color,
    borderRadius: BorderRadius.circular(radius),
    border: Border.all(color: borderColor),
  );
}

class AppBoxDecorationImage extends StatelessWidget {
  final double width;
  final double height;
  final String imagePath;
  const AppBoxDecorationImage({
    super.key,
     this.width=40,
     this.height=40,
     this.imagePath=ImageRes.person ,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          image:  DecorationImage(
            fit: BoxFit.fitHeight,
            image: AssetImage(imagePath),
          ),
          borderRadius: BorderRadius.circular(20.w)),
    );
  }
}
