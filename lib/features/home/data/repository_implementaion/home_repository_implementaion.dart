import 'package:act_hub/config/constants.dart';
import 'package:act_hub/core/error_handler/error_handler.dart';
import 'package:act_hub/core/internet_checker/internet_checker.dart';
import 'package:act_hub/features/home/data/data_source/remote_home_data_source.dart';
import 'package:act_hub/features/home/data/mapper/home_mapper.dart';
import 'package:act_hub/features/home/domian/model/home_model.dart';
import 'package:act_hub/features/home/domian/repository/home_repository.dart';
import 'package:dartz/dartz.dart';

class HomeRepositoryImplementation extends HomeRepository {
  RemoteHomeDataSource _dataSource;
  NetworkInfo _networkInfo;

  HomeRepositoryImplementation(this._dataSource, this._networkInfo);

  @override
  Future<Either<Failure, HomeModel>> home() async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _dataSource.homeData();
        return Right(response.toDomain());
      } catch (e) {
        return Left(ErrorHandler.handle(e).failure);
      }
    } else {
      return Left(Failure(ResponseCode.NO_INTERNET_CONNECTION.value,
          ApiConstant.noInternetConnection));
    }
  }
}
