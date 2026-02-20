import 'package:dartz/dartz.dart';
import 'package:segments_clean_arch/core/utils/failure.dart';
import 'package:segments_clean_arch/features/home/domain/entities/segment_response_entity.dart';

abstract class UserAuthRepository {
  Future<Either<Failure, List<SegmentResponseEntity>>> getSegments();
}
