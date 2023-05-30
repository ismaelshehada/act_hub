import 'package:act_hub/core/network/app_api.dart';
import 'package:act_hub/features/auth/data/request/login_request.dart';
import 'package:act_hub/features/auth/data/response/login_response.dart';

abstract class RemoteLoginDataSource {
  Future<LoginResponse> login(LoginRequest loginRequest);
}

class RemoteLoginDataSourceImplement implements RemoteLoginDataSource {
  final AppApi _appApi;

  RemoteLoginDataSourceImplement(this._appApi);

  @override
  Future<LoginResponse> login(LoginRequest loginRequest) async {
    return await _appApi.login(
      loginRequest.email,
      loginRequest.password,
    );
  }
}
