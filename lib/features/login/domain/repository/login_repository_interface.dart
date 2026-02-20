import 'package:segments_clean_arch/features/login/domain/entity/login_response_entity.dart';

abstract class LoginRepositoryInterface {
  Future<LoginResponseEntity> login(
    String mobile,
    String password,
    String countryCode,
  );
}
