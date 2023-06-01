import 'package:act_hub/config/constants.dart';
import 'package:act_hub/core/error_handler/error_handler.dart';
import 'package:act_hub/core/internet_checker/internet_checker.dart';
import 'package:act_hub/features/auth/data/data_source/remote_login_data_source.dart';
import 'package:act_hub/features/auth/data/mapper/login_mapper.dart';
import 'package:act_hub/features/auth/data/request/login_request.dart';
import 'package:act_hub/features/auth/domin/model/login.dart';
import 'package:act_hub/features/auth/domin/repository/login_repository.dart';
import 'package:dartz/dartz.dart';

class LoginRepositoryImpl implements LoginRepository {
  final RemoteLoginDataSourceImplement _dataSourceImplement;

  final NetworkInfoImpl networkInfoImpl;

  LoginRepositoryImpl(this._dataSourceImplement, this.networkInfoImpl);

  @override
  Future<Either<Failure, Login>> login(LoginRequest loginRequest) async {
    if (await networkInfoImpl.isConnected) {
      try {
        final response = await _dataSourceImplement.login(loginRequest);
        return Right(response.toDomain());
      } catch (e) {
        return Left(
          ErrorHandler.handle(e).failure,
        );
      }
    } else {
      return Left(
        Failure(ResponseCode.NO_INTERNET_CONNECTION.value,
            ApiConstant.no_internet_connection),
      );
    }
  }
}
