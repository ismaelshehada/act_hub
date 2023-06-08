import 'package:act_hub/core/error_handler/error_handler.dart';
import 'package:act_hub/core/use_case/base_use_case.dart';
import 'package:act_hub/features/home/data/repository_implementaion/home_repository_implementaion.dart';
import 'package:act_hub/features/home/domian/model/home_model.dart';
import 'package:dartz/dartz.dart';

class HomeUseCase implements BaseOutUseCase {
  final HomeRepositoryImplementation _homeRepositoryImplementation;

  HomeUseCase(this._homeRepositoryImplementation);

  @override
  Future<Either<Failure, HomeModel>> execute() async {
    return await _homeRepositoryImplementation.home();
  }
}
