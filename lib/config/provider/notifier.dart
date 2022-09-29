import 'package:flutter/material.dart';

import '../preferences/session.dart';

class SessionNotifier extends ChangeNotifier {
  final SessionPreferences _prefs = SessionPreferences();

  String _token = '';
  String _user = '';

  SessionNotifier() {
    _hasSession();
  }

  String get token => _token;

  String get user => _user;

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

  // Mapea y actualiza el estado con la información guardada localmente
  Future<void> _hasSession() async {
    _token = _prefs.token;
    _user = _prefs.user;
    notifyListeners();
  }
}
