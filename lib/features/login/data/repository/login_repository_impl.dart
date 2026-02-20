import 'package:segments_clean_arch/features/login/data/data_source/login_data_source_interface.dart';
import 'package:segments_clean_arch/features/login/domain/entity/login_response_entity.dart';
import 'package:segments_clean_arch/features/login/domain/repository/login_repository_interface.dart';

class LoginRepositoryImpl implements LoginRepositoryInterface {
  final LoginDataSource dataSource;

  LoginRepositoryImpl({required this.dataSource});

  @override
  Future<LoginResponseEntity> login(
    String mobile,
    String password,
    String countryCode,
  ) {
    return dataSource.login(mobile, password, countryCode);
  }
}
