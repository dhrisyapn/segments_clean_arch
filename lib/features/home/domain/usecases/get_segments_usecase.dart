import 'package:dartz/dartz.dart';
import 'package:segments_clean_arch/core/utils/failure.dart';
import 'package:segments_clean_arch/features/home/domain/entities/segment_response_entity.dart';
import 'package:segments_clean_arch/features/home/domain/repositories/user_auth_repository_interface.dart';

class GetSegmentsUseCase {
  final UserAuthRepository repository;

  GetSegmentsUseCase({required this.repository});

  Future<Either<Failure, List<SegmentResponseEntity>>> getSegments() async {
    return repository.getSegments();
  }
}
