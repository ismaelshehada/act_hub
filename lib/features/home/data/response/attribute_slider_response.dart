import 'package:json_annotation/json_annotation.dart';

part 'attribute_slider_response.g.dart';

@JsonSerializable()
class AttributesSliderResponse {
  @JsonKey(name: 'title')
  String? title;
  @JsonKey(name: 'description')
  String? description;
  @JsonKey(name: 'image')
  String? image;
  @JsonKey(name: 'type')
  String? type;
  @JsonKey(name: 'id')
  String? id;

  AttributesSliderResponse({
    this.title,
    this.description,
    this.image,
    this.type,
    this.id,
  });

  factory AttributesSliderResponse.fromJson(Map<String, dynamic> json) =>
      _$AttributesSliderResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AttributesSliderResponseToJson(this);
}
