// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attribute_slider_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AttributesSliderResponse _$AttributesSliderResponseFromJson(
        Map<String, dynamic> json) =>
    AttributesSliderResponse(
      title: json['title'] as String?,
      description: json['description'] as String?,
      image: json['image'] as String?,
      type: json['type'] as String?,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$AttributesSliderResponseToJson(
        AttributesSliderResponse instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'image': instance.image,
      'type': instance.type,
      'id': instance.id,
    };
