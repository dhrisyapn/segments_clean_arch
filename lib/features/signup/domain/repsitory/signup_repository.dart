import 'package:segments_clean_arch/features/signup/domain/entity/signup_response_entity.dart';

abstract class SignupRepositoryInterface {
  Future<SignupResponseEntity> signup(
    String name,
    String email,
    String mobile,
    String password,
    String selectedSegment,
  );
}
