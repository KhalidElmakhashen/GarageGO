import 'package:flutter/material.dart';
import 'package:legarage/features/log_in/ui/login_page.dart';

import 'package:legarage/features/main_wrapper/home_page.dart';
import 'package:legarage/features/sign_up/ui/register_page.dart';

class AppRouter {
  static Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case ('/'):
        return MaterialPageRoute(builder: (_) => LoginPage());
      case ('register'):
        return MaterialPageRoute(builder: (_) => RegisterPage());
      case ('homePage'):
        return MaterialPageRoute(builder: (_) => HomePage()); 
    }
    return null;
  }
}
