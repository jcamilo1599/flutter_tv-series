import '../domain/use_cases/login/login.dart';

class UseCaseConfig {
  // Login
  late LoginUseCase loginUseCase;

  UseCaseConfig() {
    // Login
    loginUseCase = LoginUseCase();
  }
}
