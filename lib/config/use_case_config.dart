import '../domain/use_cases/favorites/favorites.dart';
import '../domain/use_cases/login/login.dart';
import '../domain/use_cases/series/series.dart';
import '../domain/use_cases/start/start.dart';
import '../domain/use_cases/watch_now/watch_now.dart';
import '../infrastructure/driven_adapter/series.dart';

class UseCaseConfig {
  // Login
  late LoginUseCase loginUseCase;

  // Series
  late SeriesUseCase seriesUseCase;
  late SeriesApi _seriesApi;

  // Favorites
  late FavoritesUseCase favoritesUseCase;

  // Watch now
  late WatchNowUseCase watchNowUseCase;

  // Start
  late StartUseCase startUseCase;

  UseCaseConfig() {
    // Login
    loginUseCase = LoginUseCase();

    // Series
    _seriesApi = SeriesApi();
    seriesUseCase = SeriesUseCase(_seriesApi);

    // Favorites
    favoritesUseCase = FavoritesUseCase();

    // Watch now
    watchNowUseCase = WatchNowUseCase();

    // Start
    startUseCase = StartUseCase();
  }
}
