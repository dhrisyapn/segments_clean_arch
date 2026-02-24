import 'package:dartz/dartz.dart';
import 'package:segments_clean_arch/core/utils/exceptions.dart';
import 'package:segments_clean_arch/core/utils/failure.dart';
import 'package:segments_clean_arch/features/login/data/data_source/login_data_source_interface.dart';
import 'package:segments_clean_arch/features/login/domain/entity/login_response_entity.dart';
import 'package:segments_clean_arch/features/login/domain/repository/login_repository_interface.dart';

class LoginRepositoryImpl implements LoginRepositoryInterface {
  final LoginDataSource dataSource;

  LoginRepositoryImpl({required this.dataSource});

  @override
  Future<Either<Failure, LoginResponseEntity>> login(
    String mobile,
    String password,
    String countryCode,
  ) async {
    try {
      final response = await dataSource.login(mobile, password, countryCode);
      return Right(response);
    } on NoInternetException catch (e) {
      return Left(NetworkFailure(e.message));
    } on Exception catch (e) {
      return Left(ServerFailure(e.toString()));
    } catch (e) {
      return Left(UnexpectedFailure(e.toString()));
    }
  }
}
