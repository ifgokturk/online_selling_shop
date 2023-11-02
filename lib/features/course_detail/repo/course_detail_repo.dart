import 'package:online_selling_shop/common/models/course_entities.dart';
import 'package:online_selling_shop/common/services/http_util.dart';


class CourseDetailRepo {
  static Future<CourseDetailResponseEntity> courseDetail(
      {CourseRequestEntity? params}) async {
    var response = await HttpUtil()
        .post("api/courseDetail", queryParameters: params?.toJson());

    return CourseDetailResponseEntity.fromJson(response);
  }
}