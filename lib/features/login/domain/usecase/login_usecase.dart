import 'package:dartz/dartz.dart';
import 'package:segments_clean_arch/core/utils/failure.dart';
import 'package:segments_clean_arch/features/login/domain/entity/login_response_entity.dart';
import 'package:segments_clean_arch/features/login/domain/repository/login_repository_interface.dart';

class LoginUsecase {
  final LoginRepositoryInterface repository;
  LoginUsecase({required this.repository});

  Future<Either<Failure, LoginResponseEntity>> login(
    String mobile,
    String password,
    String countryCode,
  ) async {
    return await repository.login(mobile, password, countryCode);
  }
}
