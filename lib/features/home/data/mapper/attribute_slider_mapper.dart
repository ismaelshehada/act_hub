import 'package:act_hub/core/extensions/extensions.dart';
import 'package:act_hub/features/home/data/response/attribute_slider_response.dart';
import 'package:act_hub/features/home/domian/model/attribute_slider_model.dart';

extension AttributeSliderMapper on AttributesSliderResponse {
  AttributeSliderModel toDomain() {
    return AttributeSliderModel(
        id: id.onNull(),
        type: type.onNull(),
        image: image.onNull(),
        description: description.onNull(),
        title: title.onNull());
  }
}
