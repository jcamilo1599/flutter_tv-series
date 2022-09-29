import 'package:flutter/material.dart';

import '../../ui/pages/login/login.dart';
import '../../ui/pages/start/start.dart';

class Handlers {
  // Rutas para usuarios con sesión inactiva
  static Map<String, WidgetBuilder> _inactiveSession() =>
      <String, WidgetBuilder>{
        LoginPage.routeName: (BuildContext context) => const LoginPage(),
      };

  // Rutas para usuarios con sesión activa
  static Map<String, WidgetBuilder> _activeSession() => <String, WidgetBuilder>{
        StartPage.routeName: (BuildContext context) => const StartPage(),
      };

  // Obtiene las rutas de la aplicación
  static Map<String, WidgetBuilder> getRoutes(
      BuildContext context, String token) {
    return token != '' ? _activeSession() : _inactiveSession();
  }

  // Ruta inicial
  static String getInitialRoute() => '/';
}
