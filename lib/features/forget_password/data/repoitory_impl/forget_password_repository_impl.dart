import 'package:act_hub/features/forget_password/data/mapper/forget_password_mapper.dart';
import 'package:dartz/dartz.dart';

import '../../../../config/constants.dart';
import '../../../../core/error_handler/error_handler.dart';
import '../../../../core/internet_checker/internet_checker.dart';
import '../../domain/model/forget_password.dart';
import '../../domain/repositroy/forget_password_repositroy.dart';
import '../data_sources/forget_password_remote_data_source.dart';
import '../request/forget_password_request.dart';

class ForgetPasswordRepositoryImpl extends ForgetPasswordRepository {
  final ForgetPasswordDataSource _forgetPasswordDataSource;
  final NetworkInfo _networkInfo;

  ForgetPasswordRepositoryImpl(
      this._networkInfo, this._forgetPasswordDataSource);

  @override
  Future<Either<Failure, ForgetPassword>> forgetPassword(
      ForgetPasswordRequest forgetPasswordRequest) async {
    if (await _networkInfo.isConnected) {
      /// Its connected
      try {
        final response = await _forgetPasswordDataSource
            .forgetPassword(forgetPasswordRequest);
        return Right(response.toDomain());
      } catch (e) {
        return Left(ErrorHandler.handle(e).failure);
      }
    } else {
      return Left(
        Failure(
          ResponseCode.NO_INTERNET_CONNECTION.value,
          ApiConstant.noInternetConnection,
        ),
      );
    }
  }
}
