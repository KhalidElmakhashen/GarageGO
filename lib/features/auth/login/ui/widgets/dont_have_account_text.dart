import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:legarage/core/helpers/extensions.dart';
import 'package:legarage/core/routing/routes.dart';
import 'package:legarage/core/theming/text_styles.dart';


class DontHaveAccountText extends StatelessWidget {
  const DontHaveAccountText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: 'Don\'t have an account?',
            style: TextStyles.font13DarkBlueRegular,
          ),
          TextSpan(
            text: ' Sign Up',
            style: TextStyles.font13BlueSemiBold,
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                context.pushNamed(Routes.signUpScreen);
              },
          ),
        ],
      ),
    );
  }
}