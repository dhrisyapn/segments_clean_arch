import 'package:segments_clean_arch/features/home/data/data_sources/user_auth_datasource_interface.dart';
import 'package:segments_clean_arch/features/home/domain/entities/segment_response_entity.dart';
import 'package:segments_clean_arch/features/home/domain/repositories/user_auth_repository_interface.dart';

class UserAuthRepositoryImpl implements UserAuthRepository {
  final UserAuthDataSource dataSource;

  UserAuthRepositoryImpl({required this.dataSource});

  @override
  Future<List<SegmentResponseEntity>> getSegments() async {
    return dataSource.getSegments();
  }
}
