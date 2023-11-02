import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_selling_shop/common/models/course_entities.dart';
import 'package:online_selling_shop/common/utils/app_colors.dart';
import 'package:online_selling_shop/common/utils/constanst.dart';
import 'package:online_selling_shop/common/utils/image_res.dart';
import 'package:online_selling_shop/common/widgets/app_shadow.dart';
import 'package:online_selling_shop/common/widgets/button_widgets.dart';
import 'package:online_selling_shop/common/widgets/image_widgets.dart';
import 'package:online_selling_shop/common/widgets/text_widgets.dart';

class CourseDetailThumbNail extends StatelessWidget {
  final CourseItem courseItem;
  const CourseDetailThumbNail({super.key, required this.courseItem});

  @override
  Widget build(BuildContext context) {
    return AppBoxDecorationImage(
      imagePath: "${AppConstants.IMAGE_UPLOADS_PATH}${courseItem.thumbnail}",
      width: 325.w,
      height: 200.h,
      fit: BoxFit.fitWidth,
    );
  }
}

class CourseDetailIconText extends StatelessWidget {
  final CourseItem courseItem;
  const CourseDetailIconText({super.key, required this.courseItem});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10.h),
      width: 325.w,
      child: Row(
        children: [
          GestureDetector(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
              decoration: appBoxShadow(radius: 7),
              child: const Text10Normal(
                text: "Author Page",
                color: AppColors.primaryElementText,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 30.w),
            child: Row(
              children: [
                const AppImage(
                  imagePath: ImageRes.people,
                ),
                Text11Normal(
                  text: courseItem.follow == null
                      ? "0"
                      : courseItem.follow.toString(),
                  color: AppColors.primaryThreeElementText,
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 30.w),
            child: Row(
              children: [
                const AppImage(
                  imagePath: ImageRes.star,
                ),
                Text11Normal(
                  text: courseItem.score == null
                      ? "0"
                      : courseItem.score.toString(),
                  color: AppColors.primaryThreeElementText,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CourseDetailDescription extends StatelessWidget {
  final CourseItem courseItem;
  const CourseDetailDescription({super.key, required this.courseItem});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text16Normal(
            text: courseItem.name ?? "No name.",
            color: AppColors.primarySecondaryElementText,
            textAlign: TextAlign.start,
            fontWeight: FontWeight.bold,
          ),
          Container(
            child: Text11Normal(
              text: courseItem.description ?? "No Description.",
            ),
          )
        ],
      ),
    );
  }
}

class CourseDetailGoBuyButton extends StatelessWidget {
  const CourseDetailGoBuyButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20.h),
      child: AppButton(
        buttonName: "Go Buy",
      ),
    );
  }
}

class CourseDetailIncludes extends StatelessWidget {
  final CourseItem courseItem;
  const CourseDetailIncludes({super.key, required this.courseItem});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text14Normal(
            text: "Course Includes",
            color: AppColors.primarySecondaryElementText,
            textAlign: TextAlign.start,
            fontWeight: FontWeight.bold,
          ),
          SizedBox(
            height: 10.h,
          ),
          CourseInfo(
            imagePath: ImageRes.videoDetail,
            itemLenght: courseItem.video_len,
            infoText: "Hours video",
          ),
          SizedBox(
            height: 16.h,
          ),
          CourseInfo(
            imagePath: ImageRes.fileDetail,
            itemLenght: courseItem.lesson_num,
            infoText: "Number of files",
          ),
          SizedBox(
            height: 16.h,
          ),
          CourseInfo(
            imagePath: ImageRes.downloadDetail,
            itemLenght: courseItem.down_num,
            infoText: "Number of items to download",
          ),
        ],
      ),
    );
  }
}

class CourseInfo extends StatelessWidget {
  final String imagePath;
  final int? itemLenght;
  final String? infoText;
  const CourseInfo({
    super.key,
    required this.imagePath,
    required this.itemLenght,
    this.infoText = "item",
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          alignment: Alignment.center,
          child: AppImage(
            imagePath: imagePath,
            height: 30.h,
            width: 30.w,
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 10.w),
          child: Text11Normal(
            text: itemLenght == null ? "0 $infoText" : "$itemLenght $infoText",
            color: AppColors.primarySecondaryElementText,
          ),
        )
      ],
    );
  }
}


class LessonInfo extends StatelessWidget {
  const LessonInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 325.w,
      height: 80.h,
      margin: EdgeInsets.only(top:20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text14Normal(
            text: "Lesson List ",
            color: AppColors.primarySecondaryElementText,
            textAlign: TextAlign.start,
            fontWeight: FontWeight.bold,
          ),
          Container(

          ),
        ],
      ),
    );
  }
}
