import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:legarage/core/di/dependency_injection.dart';
import 'package:legarage/core/routing/routes.dart';
import 'package:legarage/features/auth/login/logic/cubit/login_cubit.dart';
import 'package:legarage/features/auth/login/ui/login_screen.dart';

import 'package:legarage/features/main_wrapper/home_page.dart';
import 'package:legarage/features/onboarding/logic/complete_setup_cubit/complete_setup_cubit.dart';
import 'package:legarage/features/onboarding/ui/onboarding_screen.dart';
import 'package:legarage/features/auth/sign_up/logic/sign_up_cubit.dart';
import 'package:legarage/features/auth/sign_up/ui/sign_up_screen.dart';
import 'package:legarage/features/auth/verifing_email/logic/verification_email_cubit.dart';
import 'package:legarage/features/auth/verifing_email/ui/verifing_email_screen.dart';

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
          builder: (_) => BlocProvider(
            create: (context) => getIt<CompleteSetupCubit>(),
            child: OnboardingScreen(),
          ),
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
      case Routes.verificationScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<VerificationEmailCubit>(),
            child: const VerifingEmailScreen(),
          ),
        );
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (_) => HomePage(),
        );
      default:
        return null;
    }
  }
}
