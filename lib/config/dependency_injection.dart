import 'package:act_hub/core/internet_checker/internet_checker.dart';
import 'package:act_hub/core/network/app_api.dart';
import 'package:act_hub/core/network/dio_factory.dart';
import 'package:act_hub/core/storage/local/app_settings_shared_preferences.dart';
import 'package:act_hub/features/auth/data/data_source/remote_login_data_source.dart';
import 'package:act_hub/features/auth/data/data_source/remote_register_data_source.dart';
import 'package:act_hub/features/auth/data/repository_impl/login_repository_impl.dart';
import 'package:act_hub/features/auth/data/repository_impl/register_repository_impl.dart';
import 'package:act_hub/features/auth/domin/repository/login_repository.dart';
import 'package:act_hub/features/auth/domin/repository/register_repository.dart';
import 'package:act_hub/features/auth/domin/use_case/login_use_case.dart';
import 'package:act_hub/features/auth/domin/use_case/register_use_case.dart';
import 'package:act_hub/features/auth/presentation/controller/login_controller.dart';
import 'package:act_hub/features/auth/presentation/controller/register_controller.dart';
import 'package:act_hub/features/out_boarding/presentation/controller/out_boarding_controller.dart';
import 'package:act_hub/features/splash/presentation/controller/splash_controller.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

final instance = GetIt.instance;

initModule() async {
  WidgetsFlutterBinding.ensureInitialized();
  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();

  instance.registerLazySingleton<SharedPreferences>(
    () => sharedPreferences,
  );

  instance.registerLazySingleton<AppSettingsSharedPreferences>(
      () => AppSettingsSharedPreferences(instance()));

  instance.registerLazySingleton(() => DioFactory());

  Dio dio = await instance<DioFactory>().getDio();

  instance.registerLazySingleton<AppApi>(() => AppApi(dio));

  instance.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(InternetConnectionCheckerPlus()));
}

initSplash() {
  Get.put<SplashController>(SplashController());
}

disposeSplash() {
  Get.delete<SplashController>();
}

initOutBoarding() {
  disposeSplash();
  Get.put<OutBoardingController>(OutBoardingController());
}

disposeOutBoarding() {
  Get.delete<OutBoardingController>();
}

initLoginModule() {
  disposeSplash();
  disposeOutBoarding();
  disposeRegisterModule();
  if (!GetIt.I.isRegistered<RemoteLoginDataSource>()) {
    instance.registerLazySingleton<RemoteLoginDataSource>(
      () => RemoteLoginDataSourceImplement(
        instance<AppApi>(),
      ),
    );
  }

  if (!GetIt.I.isRegistered<LoginRepository>()) {
    instance.registerLazySingleton<LoginRepository>(
      () => LoginRepositoryImpl(
        instance(),
        instance(),
      ),
    );
  }

  if (!GetIt.I.isRegistered<LoginUseCase>()) {
    instance.registerLazySingleton<LoginUseCase>(
      () => LoginUseCase(
        instance(),
      ),
    );
  }

  Get.put<LoginController>(LoginController());
}

disposeLoginModule() {
  if (GetIt.I.isRegistered<RemoteLoginDataSource>()) {
    instance.unregister<RemoteLoginDataSource>();
  }

  if (GetIt.I.isRegistered<LoginRepository>()) {
    instance.unregister<LoginRepository>();
  }

  if (GetIt.I.isRegistered<LoginUseCase>()) {
    instance.unregister<LoginUseCase>();
  }
  Get.delete<LoginController>();
}

initRegisterModule() {
  disposeLoginModule();

  if (!GetIt.I.isRegistered<RemoteRegisterDataSource>()) {
    instance.registerLazySingleton<RemoteRegisterDataSource>(
      () => RemoteRegisterDataSourceImplement(
        instance<AppApi>(),
      ),
    );
  }

  if (!GetIt.I.isRegistered<RegisterRepository>()) {
    instance.registerLazySingleton<RegisterRepository>(
      () => RegisterRepositoryImpl(
        instance(),
        instance<NetworkInfo>(),
      ),
    );
  }

  if (!GetIt.I.isRegistered<RegisterUseCase>()) {
    instance.registerLazySingleton<RegisterUseCase>(
      () => RegisterUseCase(
        instance(),
      ),
    );
  }
  Get.put<RegisterController>(RegisterController());
}

disposeRegisterModule() {
  if (GetIt.I.isRegistered<RemoteRegisterDataSource>()) {
    instance.unregister<RemoteRegisterDataSource>();
  }

  if (GetIt.I.isRegistered<RegisterRepository>()) {
    instance.unregister<RegisterRepository>();
  }

  if (GetIt.I.isRegistered<RegisterUseCase>()) {
    instance.unregister<RegisterUseCase>();
  }
  Get.delete<RegisterController>();
}
