import 'package:act_hub/core/extensions/extensions.dart';

import '../../domain/model/forget_password.dart';
import '../response/forget_password_response.dart';

extension ForgetPasswordMapper on ForgetPasswordResponse {
  toDomain() => ForgetPassword(
        status: status!.onNull(),
      );
}
