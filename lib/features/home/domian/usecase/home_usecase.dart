import 'package:act_hub/core/error_handler/error_handler.dart';
import 'package:act_hub/core/use_case/base_use_case.dart';
import 'package:act_hub/features/home/domian/model/home_model.dart';
import 'package:act_hub/features/home/domian/repository/home_repository.dart';
import 'package:dartz/dartz.dart';

class HomeUseCase implements BaseOutUseCase {
  final HomeRepository _homeRepository;

  HomeUseCase(this._homeRepository);

  @override
  Future<Either<Failure, HomeModel>> execute() async {
    return await _homeRepository.home();
  }
}
