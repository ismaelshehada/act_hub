import 'package:act_hub/core/error_handler/error_handler.dart';
import 'package:act_hub/features/auth/data/request/register_request.dart';
import 'package:act_hub/features/auth/domin/model/register.dart';
import 'package:dartz/dartz.dart';

abstract class RegisterRepository {
  Future<Either<Failure, Register>> register(RegisterRequest registerRequest);
}