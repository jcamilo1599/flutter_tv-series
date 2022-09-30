import '../domain/use_cases/login/login.dart';
import '../domain/use_cases/series/series.dart';
import '../infrastructure/driven_adapter/series.dart';

class UseCaseConfig {
  // Login
  late LoginUseCase loginUseCase;

  // Series
  late SeriesUseCase seriesUseCase;
  late SeriesApi _seriesApi;

  UseCaseConfig() {
    // Login
    loginUseCase = LoginUseCase();

    // Series
    _seriesApi = SeriesApi();
    seriesUseCase = SeriesUseCase(_seriesApi);
  }
}
