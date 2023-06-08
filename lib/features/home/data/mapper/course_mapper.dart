import 'package:act_hub/core/extensions/extensions.dart';
import 'package:act_hub/features/home/data/mapper/attribute_course_mapper.dart';
import 'package:act_hub/features/home/data/response/course_response.dart';
import 'package:act_hub/features/home/domian/model/course_model.dart';

extension Course on CourseResponse {
  CourseModel toDomain() {
    return CourseModel(
        id: id.onNull(),
        attributeCourseModel: attributeCourseResponse?.toDomain(),
        isRated: isRated.onNull(),
        userRate: userRate.onNull());
  }
}
