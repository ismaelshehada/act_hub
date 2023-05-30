import 'package:act_hub/core/error_handler/error_handler.dart';
import 'package:act_hub/features/auth/data/request/login_request.dart';
import 'package:act_hub/features/auth/domin/model/login.dart';
import 'package:dartz/dartz.dart';

abstract class LoginRepository {
  Future<Either<Failure, Login>> login(LoginRequest loginRequest);
}
