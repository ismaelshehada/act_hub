import 'package:act_hub/features/reset_password/data/mapper/reset_password_mapper.dart';
import 'package:dartz/dartz.dart';

import '../../../../config/constants.dart';
import '../../../../core/error_handler/error_handler.dart';
import '../../../../core/internet_checker/internet_checker.dart';
import '../../domain/model/reset_password.dart';
import '../../domain/repositroy/reset_password_repositroy.dart';
import '../data_sources/reset_password_remote_data_source.dart';
import '../request/reset_password_request.dart';

class ResetPasswordRepositoryImpl extends ResetPasswordRepository {
  final ResetPasswordRemoteDataSource _resetPasswordDataSource;
  final NetworkInfo _networkInfo;

  ResetPasswordRepositoryImpl(
      this._networkInfo,
      this._resetPasswordDataSource,
      );

  @override
  Future<Either<Failure, ResetPassword>> resetPassword(
      ResetPasswordRequest resetPasswordRequest) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _resetPasswordDataSource.resetPassword(
          resetPasswordRequest,
        );
        return Right(response.toDomain());
      } catch (e) {
        return Left(
          ErrorHandler.handle(e).failure,
        );
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