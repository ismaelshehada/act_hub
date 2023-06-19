import 'package:act_hub/features/home/data/response/attribute_slider_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'Slider_response.g.dart';

@JsonSerializable()
class SliderResponse {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'type')
  String? type;
  @JsonKey(name: 'attributes')
  AttributesSliderResponse? attributeSliderResponse;

  SliderResponse({
    this.id,
    this.type,
    this.attributeSliderResponse,
  });

  factory SliderResponse.fromJson(Map<String, dynamic> json) =>
      _$SliderResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SliderResponseToJson(this);
}
