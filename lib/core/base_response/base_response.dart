import 'package:act_hub/config/constants.dart';
import 'package:json_annotation/json_annotation.dart';
part 'base_response.g.dart';

@JsonSerializable()
class BaseResponse {
  @JsonKey(name: ApiConstant.message)
  String? message;
}
