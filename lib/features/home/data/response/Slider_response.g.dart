// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Slider_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SliderResponse _$SliderResponseFromJson(Map<String, dynamic> json) =>
    SliderResponse(
      id: json['id'] as int?,
      type: json['type'] as String?,
      attributeSliderResponse: json['attributes'] == null
          ? null
          : AttributesSliderResponse.fromJson(
              json['attributes'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SliderResponseToJson(SliderResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'attributes': instance.attributeSliderResponse,
    };
