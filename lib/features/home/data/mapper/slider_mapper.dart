
import 'package:act_hub/core/extensions/extensions.dart';
import 'package:act_hub/features/home/data/mapper/attribute_slider_mapper.dart';
import 'package:act_hub/features/home/data/response/Slider_response.dart';
import 'package:act_hub/features/home/domian/model/slider_model.dart';


extension Slider on SliderResponse{
  SliderModel toDomain() {
    return SliderModel(
      id: id.onNull(),
      type: type.onNull(),
      attributeSliderModel: attributeSliderResponse?.toDomain(),
    );
  }
}