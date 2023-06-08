import 'package:act_hub/config/constants.dart';
import 'package:act_hub/config/request_constants.dart';
import 'package:act_hub/features/auth/data/response/login_response.dart';
import 'package:act_hub/features/auth/data/response/register_response.dart';
import 'package:act_hub/features/home/data/response/home_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

part 'app_api.g.dart';

@RestApi(baseUrl: ApiConstant.baseUrl)
abstract class AppApi {
  factory AppApi(
    Dio dio, {
    String baseUrl,
  }) = _AppApi;

  @POST(RequestConstants.login)
  Future<LoginResponse> login(
    @Field(ApiConstant.email) email,
    @Field(ApiConstant.password) password,
  );

  @POST(RequestConstants.register)
  Future<RegisterResponse> register(
    @Field(ApiConstant.name) name,
    @Field(ApiConstant.email) email,
    @Field(ApiConstant.password) password,
    @Field(ApiConstant.passwordConfirmation) passwordConfirmation,
    @Field(ApiConstant.phone) phone,
  );

  @GET(RequestConstants.home)
  Future<HomeResponse> home();
}
