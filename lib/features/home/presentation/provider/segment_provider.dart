import 'package:riverpod/legacy.dart';

import 'package:segments_clean_arch/core/utils/exceptions.dart';
import 'package:segments_clean_arch/features/home/data/data_sources/user_auth_datasource_impl.dart';
import 'package:segments_clean_arch/features/home/data/repositories/user_auth_repository_impl.dart';
import 'package:segments_clean_arch/features/home/domain/entities/segment_response_entity.dart';
import 'package:segments_clean_arch/features/home/domain/usecases/get_segments_usecase.dart';

final segmentsProvider =
    StateNotifierProvider<SegmentDataNotifier, SegmentData>((ref) {
      final authDataSource = UserAuthDataSourceImpl();
      final authRepository = UserAuthRepositoryImpl(dataSource: authDataSource);
      final useCase = GetSegmentsUseCase(repository: authRepository);

      return SegmentDataNotifier(useCase: useCase);
    });

class SegmentDataNotifier extends StateNotifier<SegmentData> {
  final GetSegmentsUseCase _useCase;

  SegmentDataNotifier({
    required GetSegmentsUseCase useCase,
  }) // Dependency injection of the use case
  : _useCase = useCase, //
       super(
         SegmentData(segments: []),
       ); //Initial state with empty segments list and loading true
  //The provider calls the use case and stores returned data in state. If it throws, error is set instead.
  Future<void> fetchSegments() async {
    state = state.copyWith(isLoading: true, error: null, isNoInternet: false);
    try {
      final segments = await _useCase.getSegments();
      state = state.copyWith(segments: segments, isLoading: false);
    } on NoInternetException {
      state = state.copyWith(isLoading: false, isNoInternet: true);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }
}
