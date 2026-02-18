import 'package:segments_clean_arch/features/home/domain/entities/segment_response_entity.dart';

abstract class UserAuthDataSource {
  Future<List<SegmentResponseEntity>> getSegments();
}
