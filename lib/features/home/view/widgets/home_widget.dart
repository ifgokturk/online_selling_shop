import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_selling_shop/common/utils/image_res.dart';
import 'package:online_selling_shop/common/widgets/app_shadow.dart';
import 'package:online_selling_shop/common/widgets/image_widgets.dart';
import 'package:online_selling_shop/features/home/controller/home_controller.dart';
import '../../../../common/utils/app_colors.dart';
import '../../../../common/widgets/text_widgets.dart';
import '../../../../global.dart';

class HomeBanner extends StatelessWidget {
  final PageController controller;
  final WidgetRef ref;
  const HomeBanner({super.key, required this.controller, required this.ref});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //images
        SizedBox(
          width: 325.w,
          height: 160.h,
          child: PageView(
            controller: controller,
            onPageChanged: (index) {
              ref.read(homeScreenBannerDotsProvider.notifier).setIndex(index);
            },
            children: [
              bannerContainer(imagePath: ImageRes.banner1),
              bannerContainer(imagePath: ImageRes.banner2),
              bannerContainer(imagePath: ImageRes.banner3),
            ],
          ),
        ),
        SizedBox(
          height: 5.h,
        ),
        //dots
        DotsIndicator(
          position: ref.watch(homeScreenBannerDotsProvider),
          dotsCount: 3,
          mainAxisAlignment: MainAxisAlignment.center,
          decorator: DotsDecorator(
            size: const Size.square(9.0),
            activeSize: const Size(24.0, 8.0),
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.w),
            ),
          ),
        ),
      ],
    );
  }
}

Widget bannerContainer({required String imagePath}) {
  return Container(
    width: 325.w,
    height: 160.h,
    decoration: BoxDecoration(
        image: DecorationImage(
      image: AssetImage(imagePath),
      fit: BoxFit.fill,
    )),
  );
}

class UserName extends StatelessWidget {
  const UserName({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: text24Normal(
        text: Global.storageService.getUserProfile().name!,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class HelloText extends StatelessWidget {
  const HelloText({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: text24Normal(
        color: AppColors.primaryThreeElementText,
        text: "Home",
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

AppBar homeAppBar() {
  return AppBar(
    title: Container(
      margin: EdgeInsets.only(left: 7.w, right: 7.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          appImage(
            width: 18.w,
            height: 12.h,
            imagePath: ImageRes.menu,
          ),
          GestureDetector(
            child: const AppBoxDecorationImage(),
          ),
        ],
      ),
    ),
  );
}

class HomeMenuBar extends StatelessWidget {
  const HomeMenuBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //see all
        Container(
          margin: EdgeInsets.only(top: 15.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Text16Normal(
                text: "Choose your course",
                fontWeight: FontWeight.bold,
              ),
              GestureDetector(
                child: const Text10Normal(
                  text: "See All",
                ),
              )
            ],
          ),
        ),
        //courese button
        SizedBox(height: 20.h,),
        Row(
          children: [
            Container(
              decoration: appBoxShadow(
                color: AppColors.primaryElement,
                radius: 7.w,
              ),
              padding: EdgeInsets.only(
                left: 15.w,
                right: 15.w,
              ),
              child: const Text11Normal(
                text: "All",
              ),
            ),
            Container(margin: EdgeInsets.only(left: 30.w),
              child: const Text11Normal(
                text: "Popular",
                color: AppColors.primarySecondaryElementText,
              ),
            ),
          ],
        ),
      ],
    );
  }
}



class CourseItemGrid extends StatelessWidget {
  const CourseItemGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return
      Container(
        child: Text(""),
      )
    ;
  }
}
