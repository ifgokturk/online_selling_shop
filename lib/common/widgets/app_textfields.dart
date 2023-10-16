import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_selling_shop/common/widgets/text_widgets.dart';

import 'app_shadow.dart';
import 'image_widgets.dart';

Widget appTextField({
  TextEditingController? controller,
  String text = "",
  String iconName = "",
  String hintText = "Type anything",
  bool obsecureText = false,
  void Function(String value)? func,
}) {
  return Container(
    padding: EdgeInsets.only(left: 25.w, right: 25.w),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text14Normal(text: text),
        SizedBox(
          height: 5.h,
        ),
        Container(
          height: 50.h,
          width: 350.w,
          //color: Colors.red,
          decoration: appBoxDecorationTextField(),
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.only(left: 20.w),
                child: appImage(imagePath: iconName),
              ),
             appTextFieldOnly(controller: controller, hintText: hintText, func: func,
             obsecureText: obsecureText,
             ),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget appTextFieldOnly({
  TextEditingController? controller,
  String hintText = "Type your info",
  double width = 280,
  double height = 50,
  void Function(String value)? func,
  bool obsecureText =false,
}) {
  return SizedBox(
    width: width.w,
    height: height.h,
    child: TextField(
      controller: controller,
      onChanged: (value) => func!(value),
      keyboardType: TextInputType.multiline,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(top: 7.h,left: 10.w),
        hintText: hintText,
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.transparent,
          ),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.transparent,
          ),
        ),
        disabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.transparent,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.transparent,
          ),
        ),
      ),
      maxLines: 1,
      obscureText: obsecureText,
      autocorrect: false,
    ),
  );
}
