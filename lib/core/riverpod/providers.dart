import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:segments_clean_arch/features/home/data/data_sources/user_auth_datasource_impl.dart';
import 'package:segments_clean_arch/features/home/data/data_sources/user_auth_datasource_interface.dart';
import 'package:segments_clean_arch/features/home/data/repositories/user_auth_repository_impl.dart';
import 'package:segments_clean_arch/features/home/domain/repositories/user_auth_repository_interface.dart';
import 'package:segments_clean_arch/features/home/domain/usecases/get_segments_usecase.dart';

/// DataSource provider
final userAuthDataSourceProvider = Provider<UserAuthDataSource>((ref) {
  return UserAuthDataSourceImpl();
});

/// Repository provider
final userAuthRepositoryProvider = Provider<UserAuthRepository>((ref) {
  return UserAuthRepositoryImpl(
    dataSource: ref.read(userAuthDataSourceProvider),
  );
});

/// UseCase provider
final getSegmentsUseCaseProvider = Provider<GetSegmentsUseCase>((ref) {
  return GetSegmentsUseCase(repository: ref.read(userAuthRepositoryProvider));
});
