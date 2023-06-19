import 'package:act_hub/config/constants.dart';
import 'package:act_hub/config/dependency_injection.dart';
import 'package:act_hub/core/resources/manager_strings.dart';
import 'package:act_hub/core/storage/local/app_settings_shared_preferences.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioFactory {
  final AppSettingsSharedPreferences _appSettingsSharedPreferences =
      instance<AppSettingsSharedPreferences>();

  Future<Dio> getDio() async {
    Dio dio = Dio();

    Map<String, String> headers = {
      ApiConstant.authorization:
          getAuthorization(_appSettingsSharedPreferences.getToken()),
      ApiConstant.acceptLanguage: ApiConstant.english,
    };

    dio.options = BaseOptions(
      baseUrl: ApiConstant.baseUrl,
      headers: headers,
      sendTimeout: const Duration(
        seconds: ApiConstant.sendTimeOutDuration,
      ),
      receiveTimeout: const Duration(
        seconds: ApiConstant.receiveTimeOutDuration,
      ),
    );

    InterceptorsWrapper interceptorsWrapper = InterceptorsWrapper(onRequest:
        (RequestOptions options, RequestInterceptorHandler handler) async {
      options.headers[ApiConstant.authorization] =
          getAuthorization(_appSettingsSharedPreferences.getToken());
      return handler.next(options);
    });

    dio.interceptors.add(interceptorsWrapper);
    if (!kReleaseMode) {
      dio.interceptors.add(
        PrettyDioLogger(
          requestBody: true,
          requestHeader: true,
          request: true,
          responseBody: true,
          responseHeader: true,
        ),
      );
    }
    return dio;
  }

  String getAuthorization(String token) {
    return '${ManagerStrings.bearer} $token';
  }
}
