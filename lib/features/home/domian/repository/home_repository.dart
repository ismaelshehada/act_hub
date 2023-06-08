import 'package:act_hub/core/error_handler/error_handler.dart';
import 'package:act_hub/features/home/domian/model/home_model.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepository {
  Future<Either<Failure, HomeModel>> home();
}
