import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_selling_shop/common/utils/app_colors.dart';
import 'package:online_selling_shop/common/utils/constanst.dart';
import 'package:online_selling_shop/common/utils/image_res.dart';
import 'package:online_selling_shop/common/widgets/app_bar.dart';
import 'package:online_selling_shop/common/widgets/app_shadow.dart';
import 'package:online_selling_shop/common/widgets/image_widgets.dart';
import 'package:online_selling_shop/common/widgets/text_widgets.dart';
import 'package:online_selling_shop/features/course_detail/controller/course_detail_controller.dart';
import 'package:online_selling_shop/features/course_detail/view/widget/course_detail_widget.dart';

class CourseDetail extends ConsumerStatefulWidget {
  const CourseDetail({super.key});

  @override
  ConsumerState<CourseDetail> createState() => _CourseDetailState();
}

class _CourseDetailState extends ConsumerState<CourseDetail> {
  late var args;

  @override
  void didChangeDependencies() {
    var id = ModalRoute.of(context)!.settings.arguments as Map;

    args = id["id"];

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    var stateData =
        ref.watch(courseDetailControllerProvider(index: args.toInt()));
    return Scaffold(
      appBar: buildGlobalAppBar(title: "Course Detail"),
      body: stateData.when(
        data: (data) => data == null
            ? const SizedBox()
            : Padding(
              padding:  EdgeInsets.only(left: 25.w,right: 25.w),
              child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                  CourseDetailThumbNail(
                    courseItem: data,
                  ),
                  CourseDetailIconText(courseItem: data),
                  CourseDetailDescription(courseItem: data),
              const  CourseDetailGoBuyButton(),
                 CourseDetailIncludes(courseItem: data),
                LessonInfo(),
                ]),
            ),
        error: (error, stackTrace) {
          return Text(error.toString());
        },
        loading: () {
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
