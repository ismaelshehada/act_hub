import 'package:act_hub/core/error_handler/error_handler.dart';
import 'package:dartz/dartz.dart';

abstract class BaseUseCase<In, Out> {
  Future<Either<Failure, Out>> execute(In input);
}
