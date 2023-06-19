import 'package:act_hub/core/extensions/extensions.dart';

import '../../domain/model/reset_password.dart';
import '../response/reset_password_response.dart';

extension ResetPasswordMapper on ResetPasswordResponse {
  ResetPassword toDomain() {
    return ResetPassword(
      status: status.onNull(),
    );
  }
}
