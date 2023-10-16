import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_selling_shop/common/utils/app_colors.dart';
import 'package:online_selling_shop/common/utils/image_res.dart';
import 'package:online_selling_shop/common/widgets/image_widgets.dart';

import '../../../home/view/home.dart';

var bottomTabs = <BottomNavigationBarItem>[
  BottomNavigationBarItem(
    icon: _bottomContainer(),
    backgroundColor: AppColors.primaryBackground,
    label: "Home",
    activeIcon: _bottomContainer(color: AppColors.primaryElement),
  ),
  BottomNavigationBarItem(
    icon: _bottomContainer(imagePath: ImageRes.search),
    backgroundColor: AppColors.primaryBackground,
    label: "Home",
    activeIcon: _bottomContainer(
        imagePath: ImageRes.search, color: AppColors.primaryElement),
  ),
  BottomNavigationBarItem(
    icon: _bottomContainer(imagePath: ImageRes.play),
    backgroundColor: AppColors.primaryBackground,
    label: "Play",
    activeIcon: _bottomContainer(
        imagePath: ImageRes.play,
        color: AppColors.primaryElement),
  ),
  BottomNavigationBarItem(
    icon: _bottomContainer(imagePath: ImageRes.message),
    backgroundColor: AppColors.primaryBackground,
    label: "Message",
    activeIcon: _bottomContainer(
        imagePath: ImageRes.message,
        color: AppColors.primaryElement),
  ),
  BottomNavigationBarItem(
    icon: _bottomContainer(imagePath: ImageRes.person),
    backgroundColor: AppColors.primaryBackground,
    label: "Profile",
    activeIcon: _bottomContainer(
        imagePath: ImageRes.person, color: AppColors.primaryElement),
  ),
];

Widget _bottomContainer({
  double width = 15,
  double height = 15,
  String imagePath = ImageRes.home,
  Color color = AppColors.primaryFourElementText,
}) {
  return Container(
    width: 15.w,
    height: 15.w,
    child: appImageWithColor(
      imagePath: imagePath,
      color: color,
    ),
  );
}

Widget appScreens({required int index}) {
  List<Widget> screens = [
    const Home(),
    Center(
      child: appImage(imagePath: ImageRes.search),
    ),
    Center(
      child: appImage(imagePath: ImageRes.play),
    ),
    Center(
      child: appImage(imagePath: ImageRes.message),
    ),
    Center(
      child: appImage(imagePath: ImageRes.person),
    ),
  ];

  return screens[index];
}
