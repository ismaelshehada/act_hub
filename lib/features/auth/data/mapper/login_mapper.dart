import 'package:act_hub/core/extensions/extensions.dart';
import 'package:act_hub/features/auth/data/response/login_response.dart';
import 'package:act_hub/features/auth/domin/model/login.dart';

extension LoginMapper on LoginResponse {
  toDomain() {
    return Login(token: token.onNull());
  }
}
