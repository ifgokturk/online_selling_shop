import 'package:online_selling_shop/common/models/course_entities.dart';
import 'package:online_selling_shop/common/services/http_util.dart';

class CourseAPI {
  static courseList() async {
    var response = await HttpUtil().post('api/courseList');

    return CourseListResponseEntity.fromJson(response);
  }
}
