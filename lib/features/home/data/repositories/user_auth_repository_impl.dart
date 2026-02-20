import 'package:dartz/dartz.dart';
import 'package:segments_clean_arch/core/utils/exceptions.dart';
import 'package:segments_clean_arch/core/utils/failure.dart';
import 'package:segments_clean_arch/features/home/data/data_sources/user_auth_datasource_interface.dart';
import 'package:segments_clean_arch/features/home/domain/entities/segment_response_entity.dart';
import 'package:segments_clean_arch/features/home/domain/repositories/user_auth_repository_interface.dart';

class UserAuthRepositoryImpl implements UserAuthRepository {
  final UserAuthDataSource dataSource;

  UserAuthRepositoryImpl({required this.dataSource});

  @override
  Future<Either<Failure, List<SegmentResponseEntity>>> getSegments() async {
    try {
      final segments = await dataSource.getSegments();
      return Right(segments);
    } on NoInternetException catch (e) {
      return Left(NetworkFailure(e.message));
    } on Exception catch (e) {
      return Left(ServerFailure(e.toString()));
    } catch (e) {
      return Left(UnexpectedFailure(e.toString()));
    }
  }
}
