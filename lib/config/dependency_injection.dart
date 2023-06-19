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
import 'package:act_hub/features/home/data/data_source/remote_home_data_source.dart';
import 'package:act_hub/features/home/data/repository_implementaion/home_repository_implementaion.dart';
import 'package:act_hub/features/home/domian/repository/home_repository.dart';
import 'package:act_hub/features/home/domian/usecase/home_usecase.dart';
import 'package:act_hub/features/home/presentation/controller/home_controller.dart';
import 'package:act_hub/features/main/presentation/controller/main_controller.dart';
import 'package:act_hub/features/out_boarding/presentation/controller/out_boarding_controller.dart';
import 'package:act_hub/features/splash/presentation/controller/splash_controller.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../features/forget_password/data/data_sources/forget_password_remote_data_source.dart';
import '../features/forget_password/data/repoitory_impl/forget_password_repository_impl.dart';
import '../features/forget_password/domain/repositroy/forget_password_repositroy.dart';
import '../features/forget_password/domain/usecase/forget_password_usecase.dart';
import '../features/forget_password/presentation/controller/forget_password_controller.dart';
import '../features/reset_password/data/data_sources/reset_password_remote_data_source.dart';
import '../features/reset_password/data/repoitory_impl/reset_password_repository_impl.dart';
import '../features/reset_password/domain/repositroy/reset_password_repositroy.dart';
import '../features/reset_password/domain/usecase/reset_password_use_case.dart';
import '../features/reset_password/presentation/controller/reset_password_controller.dart';
import '../features/verification/data/data_sources/remote_verification_data_source.dart';
import '../features/verification/data/data_sources/send_otp_remote_date_source.dart';
import '../features/verification/data/repoitory_impl/send_otp_respository_impl.dart';
import '../features/verification/data/repoitory_impl/verify_email_respository_impl.dart';
import '../features/verification/domain/repositroy/send_otp_repository.dart';
import '../features/verification/domain/repositroy/verification_repository.dart';
import '../features/verification/domain/usecase/send_otp_usecase.dart';
import '../features/verification/domain/usecase/verification_usecase.dart';
import '../features/verification/presentation/controller/verification_controller.dart';

final instance = GetIt.instance;

initModule() async {
  WidgetsFlutterBinding.ensureInitialized();
  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();

  instance.registerLazySingleton<SharedPreferences>(
    () => sharedPreferences,
  );

  // TODO: ONLY FOR TEST
  // AppSettingsSharedPreferences appSettingsSharedPreferences =
  //     instance<AppSettingsSharedPreferences>();
  // appSettingsSharedPreferences.clear();

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
        instance<RemoteLoginDataSource>(),
        instance<NetworkInfo>(),
      ),
    );
  }

  if (!GetIt.I.isRegistered<LoginUseCase>()) {
    instance.registerLazySingleton<LoginUseCase>(
      () => LoginUseCase(
        instance<LoginRepository>(),
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

initMainModule() {
  Get.put<MainController>(MainController());
  initHomeModule();
}

initHomeModule() {
  if (!GetIt.I.isRegistered<RemoteHomeDataSource>()) {
    instance.registerLazySingleton<RemoteHomeDataSource>(
      () => RemoteHomeDataSourceImplement(
        instance<AppApi>(),
      ),
    );
  }

  if (!GetIt.I.isRegistered<HomeRepository>()) {
    instance.registerLazySingleton<HomeRepository>(
      () => HomeRepositoryImplementation(
        instance(),
        instance<NetworkInfo>(),
      ),
    );
  }

  if (!GetIt.I.isRegistered<HomeUseCase>()) {
    instance.registerLazySingleton<HomeUseCase>(
      () => HomeUseCase(
        instance<HomeRepository>(),
      ),
    );
  }

  Get.put<HomeController>(HomeController());
}

initVerificationModule() {
  initSendOtp();

  if (!GetIt.I.isRegistered<RemoteVerificationDataSource>()) {
    instance.registerLazySingleton<RemoteVerificationDataSource>(
      () => RemoteVerificationDataSourceImplementation(
        instance<AppApi>(),
      ),
    );
  }

  if (!GetIt.I.isRegistered<VerificationRepository>()) {
    instance.registerLazySingleton<VerificationRepository>(
      () => VerificationRepositoryImpl(
        instance<NetworkInfo>(),
        instance<RemoteVerificationDataSource>(),
      ),
    );
  }

  if (!GetIt.I.isRegistered<VerificationUseCase>()) {
    instance.registerLazySingleton<VerificationUseCase>(
      () => VerificationUseCase(
        instance<VerificationRepository>(),
      ),
    );
  }

  Get.put<VerificationController>(VerificationController());
}

initForgetPassword() async {
  disposeLoginModule();
  initSendOtp();

  if (!GetIt.I.isRegistered<ForgetPasswordDataSource>()) {
    instance.registerLazySingleton<ForgetPasswordDataSource>(
        () => RemoteForgetPasswordDataSourceImpl(instance<AppApi>()));
  }

  if (!GetIt.I.isRegistered<ForgetPasswordRepository>()) {
    instance.registerLazySingleton<ForgetPasswordRepository>(
        () => ForgetPasswordRepositoryImpl(instance(), instance()));
  }

  if (!GetIt.I.isRegistered<ForgetPasswordUseCase>()) {
    instance.registerFactory<ForgetPasswordUseCase>(
        () => ForgetPasswordUseCase(instance<ForgetPasswordRepository>()));
  }

  Get.put<ForgetPasswordController>(ForgetPasswordController());
}

disposeForgetPassword() async {
  if (GetIt.I.isRegistered<ForgetPasswordDataSource>()) {
    instance.unregister<ForgetPasswordDataSource>();
  }

  if (GetIt.I.isRegistered<ForgetPasswordRepository>()) {
    instance.unregister<ForgetPasswordRepository>();
  }

  if (GetIt.I.isRegistered<ForgetPasswordUseCase>()) {
    instance.unregister<ForgetPasswordUseCase>();
  }
}

initResetPasswordModule() {
  if (!GetIt.I.isRegistered<ResetPasswordRemoteDataSource>()) {
    instance.registerLazySingleton<ResetPasswordRemoteDataSource>(
      () => RemoteResetPasswordRemoteDataSourceImpl(
        instance<AppApi>(),
      ),
    );
  }

  if (!GetIt.I.isRegistered<ResetPasswordRepository>()) {
    instance.registerLazySingleton<ResetPasswordRepository>(
      () => ResetPasswordRepositoryImpl(
        instance<NetworkInfo>(),
        instance<ResetPasswordRemoteDataSource>(),
      ),
    );
  }

  if (!GetIt.I.isRegistered<ResetPasswordUseCase>()) {
    instance.registerLazySingleton<ResetPasswordUseCase>(
      () => ResetPasswordUseCase(
        instance<ResetPasswordRepository>(),
      ),
    );
  }

  Get.put<ResetPasswordController>(ResetPasswordController());
}

disposeResetPasswordModule() {
  disposeForgetPassword();
  if (GetIt.I.isRegistered<ResetPasswordRemoteDataSource>()) {
    instance.unregister<ResetPasswordRemoteDataSource>();
  }

  if (GetIt.I.isRegistered<ResetPasswordRepository>()) {
    instance.unregister<ResetPasswordRepository>();
  }

  if (GetIt.I.isRegistered<ResetPasswordUseCase>()) {
    instance.unregister<ResetPasswordUseCase>();
  }

  Get.delete<ResetPasswordController>();
}

initSendOtp() async {
  if (!GetIt.I.isRegistered<RemoteSendOtpDataSource>()) {
    instance.registerLazySingleton<RemoteSendOtpDataSource>(
        () => RemoteSendOtpDataSourceImpl(instance<AppApi>()));
  }

  if (!GetIt.I.isRegistered<SendOtpRepository>()) {
    instance.registerLazySingleton<SendOtpRepository>(
        () => SendOtpRepositoryImpl(instance(), instance()));
  }

  if (!GetIt.I.isRegistered<SendOtpUseCase>()) {
    instance.registerFactory<SendOtpUseCase>(
        () => SendOtpUseCase(instance<SendOtpRepository>()));
  }
}

disposeSendOtp() async {
  if (GetIt.I.isRegistered<RemoteSendOtpDataSource>()) {
    instance.unregister<RemoteSendOtpDataSource>();
  }

  if (GetIt.I.isRegistered<SendOtpRepository>()) {
    instance.unregister<SendOtpRepository>();
  }

  if (GetIt.I.isRegistered<SendOtpUseCase>()) {
    instance.unregister<SendOtpUseCase>();
  }
}
