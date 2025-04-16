import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:legarage/core/di/dependency_injection.dart';
import 'package:legarage/core/routing/routes.dart';
import 'package:legarage/features/login/logic/cubit/login_cubit.dart';
import 'package:legarage/features/login/ui/login_screen.dart';

import 'package:legarage/features/main_wrapper/home_page.dart';
import 'package:legarage/features/onboarding/onboarding_screen.dart';
import 'package:legarage/features/sign_up/logic/sign_up_cubit.dart';
import 'package:legarage/features/sign_up/ui/sign_up_screen.dart';

// class AppRouter {
//   static Route? generateRoute(RouteSettings settings) {
//     switch (settings.name) {
//       case ('/'):
//         return MaterialPageRoute(builder: (_) => LoginPage());
//       case ('register'):
//         return MaterialPageRoute(builder: (_) => RegisterPage());
//       case ('homePage'):
//         return MaterialPageRoute(builder: (_) => HomePage()); 
//     }
//     return null;
//   }
// }


class AppRouter {
   static Route? generateRoute(RouteSettings settings) {
    //this arguments to be passed in any screen like this ( arguments as ClassName )
    // ignore: unused_local_variable
    final arguments = settings.arguments;

    switch (settings.name) {
      case Routes.onBoardingScreen:
        return MaterialPageRoute(
          builder: (_) => const OnboardingScreen(),
        );
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<LoginCubit>(),
            child: const LoginScreen(),
          ),
        );
      case Routes.signUpScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<SignupCubit>(),
            child: const SignupScreen(),
          ),
        );
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (_) =>  HomePage(),
        );
      default:
        return null;
    }
  }
}
