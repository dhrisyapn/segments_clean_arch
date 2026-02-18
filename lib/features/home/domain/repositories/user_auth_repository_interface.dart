import 'package:segments_clean_arch/features/home/domain/entities/segment_response_entity.dart';

abstract class UserAuthRepository {
  Future<List<SegmentResponseEntity>> getSegments();
}
