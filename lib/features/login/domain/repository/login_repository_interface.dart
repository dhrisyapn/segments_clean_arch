import 'package:dartz/dartz.dart';
import 'package:segments_clean_arch/core/utils/failure.dart';
import 'package:segments_clean_arch/features/login/domain/entity/login_response_entity.dart';

abstract class LoginRepositoryInterface {
  Future<Either<Failure, LoginResponseEntity>> login(
    String mobile,
    String password,
    String countryCode,
  );
}
