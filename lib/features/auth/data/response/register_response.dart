import 'package:act_hub/config/constants.dart';
import 'package:act_hub/core/base_response/base_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'register_response.g.dart';


@JsonSerializable()
class RegisterResponse extends BaseResponse {
  @JsonKey(name: ApiConstant.status)
  bool? status;

  RegisterResponse(this.status);

  factory RegisterResponse.fromJson(Map<String, dynamic> json) =>
      _$RegisterResponseFromJson(json);

  Map<String, dynamic> toJson(RegisterResponse instance) =>
      _$RegisterResponseToJson(this);
}