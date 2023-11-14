import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_selling_shop/common/models/lesson_entities.dart';
import 'package:online_selling_shop/common/utils/constanst.dart';
import 'package:online_selling_shop/common/utils/image_res.dart';
import 'package:online_selling_shop/common/widgets/app_shadow.dart';
import 'package:online_selling_shop/common/widgets/image_widgets.dart';
import 'package:online_selling_shop/common/widgets/text_widgets.dart';
import 'package:online_selling_shop/features/lesson_detail/controller/lesson_controller.dart';

class LessonVideos extends StatelessWidget {
  final List<LessonVideoItem> lessonItem;
  final WidgetRef ref;
  final Function? syncVideoIndex;
  const LessonVideos({
    super.key,
    required this.lessonItem,
    required this.ref,
    required this.syncVideoIndex,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: lessonItem.length,
        itemBuilder: (_, index) {
          return Container(
            margin: EdgeInsets.only(top: 10.h),
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            width: 325.w,
            height: 80.h,
            decoration: appBoxShadow(
              radius: 10,
              sR: 2.0,
              bR: 3.0,
              color: const Color.fromRGBO(255, 255, 255, 1),
            ),
            child: InkWell(
              onTap: () {
                syncVideoIndex!(index);
                var vidUrl = lessonItem[index].url;
                ref
                    .read(lessonDataControllerProvider.notifier)
                    .playNextVid(vidUrl!);
              },
              child: Row(
                //crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AppBoxDecorationImage(
                    width: 60.w,
                    height: 60.h,
                    imagePath:
                        "${AppConstants.IMAGE_UPLOADS_PATH}${lessonItem[index].thumbnail}",
                    fit: BoxFit.fill,
                  ),
                  SizedBox(
                    width: 8.w,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text13Normal(
                          text: "${lessonItem[index].name}",
                        ),
                        //  Text10Normal(
                        //   text: "${lessonItem[index].description}",
                        // ),
                      ],
                    ),
                  ),
                  Expanded(child: Container()),
                  AppImage(
                    imagePath: ImageRes.arrowRight,
                    height: 24.h,
                    width: 24.h,
                  ),
                ],
              ),
            ),
          );
        });
  }
}
