import 'package:flutter_riverpod/legacy.dart';
import 'package:segments_clean_arch/core/services/snackbar_service.dart';
import 'package:segments_clean_arch/features/signup/data/data_source/signup_data_source_impl.dart';
import 'package:segments_clean_arch/features/signup/data/repository/signup_repository_impl.dart';
import 'package:segments_clean_arch/features/signup/domain/entity/signup_response_entity.dart';
import 'package:segments_clean_arch/features/signup/domain/usecase/signup_usecase.dart';

final signupPovider = StateNotifierProvider<SignupDataNotifier, SignupData>((
  ref,
) {
  final signupDataSource = SignupDataSourceImpl();
  final signupRepository = SignupRepositoryImpl(dataSource: signupDataSource);
  final signupUsecase = SignupUsecase(repository: signupRepository);
  return SignupDataNotifier(useCase: signupUsecase);
});

class SignupDataNotifier extends StateNotifier<SignupData> {
  final SignupUsecase _useCase;

  SignupDataNotifier({required SignupUsecase useCase})
    : _useCase = useCase,
      super(SignupData(signupData: SignupResponseEntity()));

  Future<void> signup(
    String name,
    String email,
    String mobile,
    String password,
    String selectedSegment,
  ) async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final signupResponse = await _useCase.signup(
        name,
        email,
        mobile,
        password,
        selectedSegment,
      );
      state = state.copyWith(signupData: signupResponse, isLoading: false);
      SnackbarService.showSuccess('Signup successful');
    } catch (e) {
      state = state.copyWith(error: e.toString(), isLoading: false);

      SnackbarService.showError(e.toString());
    }
  }
}
