import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_selling_shop/common/utils/app_colors.dart';

Widget text24Normal({
  required String text,
  Color color = AppColors.primaryText,
  FontWeight fontWeight = FontWeight.normal,
}) {
  return Text(
    text,
    textAlign: TextAlign.center,
    style: TextStyle(
      color: color,
      fontSize: 24,
      fontWeight: fontWeight,
    ),
  );
}

class Text16Normal extends StatelessWidget {
  final String text;
  final Color color;
  final FontWeight fontWeight;
  final TextAlign? textAlign;
  const Text16Normal({
    super.key,
    this.text = "",
    this.color = AppColors.primarySecondaryElementText,
    this.fontWeight=FontWeight.normal,
    this.textAlign = TextAlign.center,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: color,
        fontSize: 16,
        fontWeight: fontWeight,
      ),
    );
  }
}

class Text14Normal extends StatelessWidget {
  final String text;
  final Color color;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  const Text14Normal({
    super.key,
    this.text = "",
    this.color = AppColors.primaryThreeElementText,
    this.fontWeight,
    this.textAlign,

  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
        color: color,
        fontSize: 14,
        fontWeight: fontWeight,
      ),
    );
  }
}



Widget textUnderline({String text = "Your text"}) {
  return GestureDetector(
    onTap: () {},
    child: Text(text,
        style: TextStyle(
          fontWeight: FontWeight.normal,
          fontSize: 12.sp,
          color: AppColors.primaryText,
          decoration: TextDecoration.underline,
          decorationColor: AppColors.primaryText,
        )),
  );
}



class Text10Normal extends StatelessWidget {
  final String text;
  final Color color;
  const Text10Normal({
    super.key,
    this.text = "",
    this.color = AppColors.primaryThreeElementText,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: TextOverflow.ellipsis,
      maxLines: 2,
      textAlign: TextAlign.start,
      style: TextStyle(
        color: color,
        fontSize: 10.sp,

      ),
    );
  }
}

class Text11Normal extends StatelessWidget {
  final String? text;
  final Color color;
  const Text11Normal({
    super.key,
    this.text = "",
    this.color = AppColors.primaryThreeElementText,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      textAlign: TextAlign.start,
      style: TextStyle(
        color: color,
        fontSize: 11.sp,

      ),
    );
  }
}

class FadeText extends StatelessWidget {
  final String text;
  final Color color;
  final double fontSize;
  const FadeText({
    super.key,
    this.text = "",
    this.color = AppColors.primaryElementText,
    this.fontSize=10,
  });

  @override
  Widget build(BuildContext context) {
    return Text(

      text,
      softWrap: true,
      maxLines: 1,
      textAlign: TextAlign.left,
      overflow: TextOverflow.fade,
      style: TextStyle(
        color: color,
        fontSize: fontSize.sp,
        fontWeight: FontWeight.bold,


      ),
    );
  }
}


class Text13Normal extends StatelessWidget {
  final String text;
  final Color color;
  final FontWeight fontWeight;
  final TextAlign? textAlign;
  const Text13Normal({
    super.key,
    this.text = "",
    this.color = AppColors.primarySecondaryElementText,
    this.fontWeight=FontWeight.bold,
    this.textAlign = TextAlign.center,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: color,
        fontSize: 13,
        fontWeight: fontWeight,
      ),
    );
  }
}
