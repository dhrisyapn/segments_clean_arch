import 'package:riverpod/legacy.dart';

import 'package:segments_clean_arch/core/riverpod/providers.dart';
import 'package:segments_clean_arch/features/home/domain/entities/segment_response_entity.dart';
import 'package:segments_clean_arch/features/home/domain/usecases/get_segments_usecase.dart';

final segmentsProvider =
    StateNotifierProvider<SegmentDataNotifier, SegmentData>((ref) {
      final useCase = ref.read(getSegmentsUseCaseProvider);
      return SegmentDataNotifier(useCase: useCase);
    });

class SegmentData {
  final List<SegmentResponseEntity> segments;
  final bool isLoading;
  final String? error;

  SegmentData({required this.segments, this.isLoading = true, this.error});

  SegmentData copyWith({
    List<SegmentResponseEntity>? segments,
    bool? isLoading,
    String? error,
  }) {
    return SegmentData(
      segments: segments ?? this.segments,
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }
}

class SegmentDataNotifier extends StateNotifier<SegmentData> {
  final GetSegmentsUseCase _useCase;

  SegmentDataNotifier({required GetSegmentsUseCase useCase})
    : _useCase = useCase,
      super(SegmentData(segments: []));
  //The provider calls the use case and stores returned data in state. If it throws, error is set instead.
  Future<void> fetchSegments() async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final segments = await _useCase.getSegments();
      state = state.copyWith(segments: segments, isLoading: false);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }
}
