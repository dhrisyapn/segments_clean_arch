import 'package:segments_clean_arch/features/signup/data/data_source/signup_data_sourece_interface.dart';
import 'package:segments_clean_arch/features/signup/domain/entity/signup_response_entity.dart';
import 'package:segments_clean_arch/features/signup/domain/repsitory/signup_repository.dart';

class SignupRepositoryImpl implements SignupRepositoryInterface {
  final SignupDataSource dataSource;

  SignupRepositoryImpl({required this.dataSource});

  @override
  Future<SignupResponseEntity> signup(
    String name,
    String email,
    String mobile,
    String password,
    String selectedSegment,
  ) {
    return dataSource.signup(name, email, mobile, password, selectedSegment);
  }
}
