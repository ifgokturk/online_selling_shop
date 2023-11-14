import 'package:online_selling_shop/common/models/course_entities.dart';
import 'package:online_selling_shop/common/models/lesson_entities.dart';
import 'package:online_selling_shop/features/buy_course/repo/buy_course_repo.dart';
import 'package:online_selling_shop/features/course_detail/repo/course_repo.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'buy_course_controller.g.dart';

@riverpod
Future<String?> buyCourseController(BuyCourseControllerRef ref,
    {required int index}) async {
  CourseRequestEntity courseRequestEntity = CourseRequestEntity();
  courseRequestEntity.id = index;
  final response =
  await BuyCourseRepo.buyCourse(params: courseRequestEntity);
  if (response.code == 200) {
    return response.data;
  } else {
    print("request failed");
  }
  return null;
}


