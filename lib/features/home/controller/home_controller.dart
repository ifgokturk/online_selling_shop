import 'package:online_selling_shop/common/api/course_api.dart';
import 'package:online_selling_shop/common/models/course_entities.dart';
import 'package:online_selling_shop/common/models/user.dart';
import 'package:online_selling_shop/global.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'home_controller.g.dart';

@Riverpod(keepAlive: true)
class HomeScreenBannerDots extends _$HomeScreenBannerDots {
  @override
  int build() => 0;

  void setIndex(int value) {
    state = value;
  }
}

@riverpod
class HomeUserProfile extends _$HomeUserProfile {
  FutureOr<UserProfile> build() {
    return Global.storageService.getUserProfile();
  }
}

@Riverpod(keepAlive: true)
class HomeCourseList extends _$HomeCourseList {
  Future<List<CourseItem>?> fetchCourseList() async {
    var result = await CourseAPI.courseList();
    if (result.code == 200) {
      return result.data;
    }
    return null;
  }

  @override
  FutureOr<List<CourseItem>?> build() async {
    return fetchCourseList();
  }
}
