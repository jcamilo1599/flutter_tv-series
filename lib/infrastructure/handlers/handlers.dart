import 'package:flutter/material.dart';

import '../../ui/pages/home/home.dart';
import '../../ui/pages/login/login.dart';

class Handlers {
  // Rutas para usuarios con sesión inactiva
  static Map<String, WidgetBuilder> _inactiveSession() =>
      <String, WidgetBuilder>{
        LoginPage.routeName: (BuildContext context) => const LoginPage(),
      };

  // Rutas para usuarios con sesión activa
  static Map<String, WidgetBuilder> _activeSession() => <String, WidgetBuilder>{
        HomePage.routeName: (BuildContext context) => const HomePage(),
      };

  // Obtiene las rutas de la aplicación
  static Map<String, WidgetBuilder> getRoutes(
      BuildContext context, String token) {
    return token != '' ? _activeSession() : _inactiveSession();
  }

  // Ruta inicial
  static String getInitialRoute() => '/';
}
