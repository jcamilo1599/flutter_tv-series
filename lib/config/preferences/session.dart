import 'package:shared_preferences/shared_preferences.dart';

class SessionPreferences {
  static final SessionPreferences _instance = SessionPreferences._internal();

  factory SessionPreferences() => _instance;
  SharedPreferences? _prefs;

  SessionPreferences._internal();

  Future<void> initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
  }

  set token(String value) => _prefs?.setString('token', value);

  set user(String value) => _prefs?.setString('user', value);

  String get token => _prefs?.getString('token') ?? '';

  String get user => _prefs?.getString('user') ?? '';
}
