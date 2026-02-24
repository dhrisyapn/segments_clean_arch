import 'package:segments_clean_arch/features/signup/domain/entity/signup_response_entity.dart';
import 'package:segments_clean_arch/features/signup/domain/repsitory/signup_repository.dart';

class SignupUsecase {
  final SignupRepositoryInterface repository;

  SignupUsecase({required this.repository});

  Future<SignupResponseEntity> signup(
    String name,
    String email,
    String mobile,
    String password,
    String selectedSegment,
  ) async {
    return await repository.signup(
      name,
      email,
      mobile,
      password,
      selectedSegment,
    );
  }
}
