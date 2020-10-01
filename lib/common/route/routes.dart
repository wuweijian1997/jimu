import 'package:flutter/material.dart';
import 'package:jimu/pages/index.dart';

class AppRoutes {
  static const String INITIAL_ROUTE = StartupScreenPage.rName;

  static Map<String, WidgetBuilder> configRoutes = {
    StartupScreenPage.rName: (context) => StartupScreenPage(),
    LoginPage.rName: (context) => LoginPage(),
    RegisterPage.rName: (context) => RegisterPage(),
    PasswordLoginPage.rName: (context) => PasswordLoginPage(),
  };
}