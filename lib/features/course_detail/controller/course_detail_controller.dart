import 'package:online_selling_shop/common/models/course_entities.dart';
import 'package:online_selling_shop/features/course_detail/repo/course_detail_repo.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'course_detail_controller.g.dart';

@riverpod
Future<CourseItem?> courseDetailController(CourseDetailControllerRef ref,
{required int index}) async {
  CourseRequestEntity courseRequestEntity = CourseRequestEntity();
  courseRequestEntity.id = index;
  final response =
      await CourseDetailRepo.courseDetail(params: courseRequestEntity);
  if (response.code == 200) {
    return response.data;
  } else {
    print("request failed");
  }
  return null;
}
