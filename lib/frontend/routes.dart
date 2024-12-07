




import 'package:flutter/material.dart';
import 'package:legarage/frontend/screens/home_page.dart';
import 'package:legarage/frontend/screens/login_page.dart';
import 'package:legarage/frontend/screens/register_page.dart';

class AppRouter{

  static Route? generateRoute(RouteSettings settings){
    switch(settings.name){
      case('/'):
        return MaterialPageRoute(builder: (_)=> LoginPage());
      case('register'):
        return MaterialPageRoute(builder: (_)=> RegisterPage());
      case('homePage'):
        return MaterialPageRoute(builder: (_)=> HomePage());
    }
    return null;
  }
}