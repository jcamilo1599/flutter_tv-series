import 'package:flutter/material.dart';

import 'preferences.dart';

class SessionNotifier extends ChangeNotifier {
  final SessionPreferences _prefs = SessionPreferences();

  // usuario
  String _token = '';
  String _user = '';

  // series
  String _popular = '';
  String _favorites = '';

  SessionNotifier() {
    _hasSession();
  }

  String get token => _token;

  String get user => _user;

  String get popular => _popular;

  String get favorites => _favorites;

  set token(String value) {
    _prefs.token = value;
    _token = value;
    notifyListeners();
  }

  set user(String value) {
    _prefs.user = value;
    _user = value;
    notifyListeners();
  }

  set popular(String value) {
    _prefs.popular = value;
    _popular = value;
    notifyListeners();
  }

  set favorites(String value) {
    _prefs.favorites = value;
    _favorites = value;
    notifyListeners();
  }

  // Mapea y actualiza el estado con la información guardada localmente
  Future<void> _hasSession() async {
    _token = _prefs.token;
    _user = _prefs.user;
    _popular = _prefs.popular;
    _favorites = _prefs.favorites;
    notifyListeners();
  }
}
