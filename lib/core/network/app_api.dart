import 'package:act_hub/config/constants.dart';
import 'package:act_hub/config/request_constants.dart';
import 'package:act_hub/features/auth/data/response/login_response.dart';
import 'package:act_hub/features/auth/data/response/register_response.dart';
import 'package:act_hub/features/home/data/response/home_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../../features/forget_password/data/response/forget_password_response.dart';
import '../../features/reset_password/data/response/reset_password_response.dart';
import '../../features/verification/data/response/send_otp_response.dart';
import '../../features/verification/data/response/verification_response.dart';

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

  @POST(RequestConstants.resetPassword)
  Future<ResetPasswordResponse> resetPassword(
    @Field(ApiConstant.email) email,
    @Field(ApiConstant.password) password,
    @Field(ApiConstant.otp) otp,
  );

  @POST(RequestConstants.emailVerification)
  Future<VerificationResponse> emailVerification(
      @Field(ApiConstant.verificationEmail) email,
      @Field(ApiConstant.otp) otp,
      );

   @POST(RequestConstants.forgetPasswordRequest)
  Future<ForgetPasswordResponse> forgetPassword(
      @Field(ApiConstant.email) String email,
      );

  @POST(RequestConstants.sendOtp)
  Future<SendOtpResponse> sendOtp(
      @Field(ApiConstant.email) String email,
      );


}
