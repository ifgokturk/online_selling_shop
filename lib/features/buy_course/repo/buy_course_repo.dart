import 'package:online_selling_shop/common/models/base_entities.dart';
import 'package:online_selling_shop/common/models/course_entities.dart';
import 'package:online_selling_shop/common/services/http_util.dart';


class BuyCourseRepo {
  static Future<BaseResponseEntity> buyCourse(
      {CourseRequestEntity? params}) async {
    var response = await HttpUtil()
        .post("api/checkout", queryParameters: params?.toJson());

    return BaseResponseEntity.fromJson(response);
  }




}
