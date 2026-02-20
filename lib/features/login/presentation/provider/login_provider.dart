import 'package:riverpod/legacy.dart';
import 'package:segments_clean_arch/core/services/snackbar_service.dart';
import 'package:segments_clean_arch/features/login/data/data_source/login_data_source_impl.dart';
import 'package:segments_clean_arch/features/login/data/repository/login_repository_impl.dart';
import 'package:segments_clean_arch/features/login/domain/entity/login_response_entity.dart';
import 'package:segments_clean_arch/features/login/domain/usecase/login_usecase.dart';

final loginDataProvider = StateNotifierProvider<LoginDataNotifier, LoginData>((
  ref,
) {
  final loginDataSource = LoginDataSourceImpl();
  final loginRepository = LoginRepositoryImpl(dataSource: loginDataSource);
  final loginUsecase = LoginUsecase(repository: loginRepository);
  return LoginDataNotifier(useCase: loginUsecase);
});

class LoginDataNotifier extends StateNotifier<LoginData> {
  final LoginUsecase _useCase;

  LoginDataNotifier({required LoginUsecase useCase})
    : _useCase = useCase,
      super(LoginData(loginData: LoginResponseEntity()));

  Future<void> login(String mobile, String password, String countryCode) async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final loginResponse = await _useCase.login(mobile, password, countryCode);
      state = state.copyWith(loginData: loginResponse, isLoading: false);
    } catch (e) {
      state = state.copyWith(error: e.toString(), isLoading: false);
      String errorMessage = 'An error occurred';
      if (e is Map && (e.containsKey('message') || e.containsKey('error'))) {
        errorMessage = e['message'] ?? e['error'] ?? errorMessage;
      } else if (e is Exception) {
        errorMessage = e.toString();
      }
      SnackbarService.showError(errorMessage);
    }
  }
}
