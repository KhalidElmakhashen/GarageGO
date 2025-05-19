



import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:legarage/core/helpers/extensions.dart';
import 'package:legarage/core/routing/routes.dart';
import 'package:legarage/core/theming/colors.dart';
import 'package:legarage/core/theming/text_styles.dart';
import 'package:legarage/features/auth/verifing_email/logic/verification_email_cubit.dart';

import '../../logic/verification_email_state.dart';


class VerificationEmailBlocListener extends StatelessWidget {
  const VerificationEmailBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<VerificationEmailCubit, VerificationEmailState>(
      listenWhen: (previous, current) =>
          current is VerificationEmailLoading ||
          current is VerificationEmailSuccess || 
          current is VerificationEmailError,
      listener: (context, state) {
        state.whenOrNull(
          verificationEmailLoading: () {
            showDialog(
              context: context,
              builder: (context) => const Center(
                child: CircularProgressIndicator(
                  color: ColorsManager.mainBlue,
                ),
              ),
            );
          },
          verificationEmailSuccess: (signupResponse) {
            context.pop();
            showSuccessDialog(context);
          },
          verificationEmailError: (error) {
            setupErrorState(context, error);
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }

  void showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Done'),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Congratulations, you have verified successfully!'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.white, backgroundColor: Colors.blue, disabledForegroundColor: Colors.grey.withOpacity(0.38),
              ),
              onPressed: () {
                context.pushNamed(Routes.loginScreen);
              },
              child: const Text('Continue'),
            ),
          ],
        );
      },
    );
  }

  void setupErrorState(BuildContext context, String error) {
    context.pop();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        icon: const Icon(
          Icons.error,
          color: Colors.red,
          size: 32,
        ),
        content: Text(
          error,
          style: TextStyles.font15DarkBlueMedium,
        ),
        actions: [
          TextButton(
            onPressed: () {
              context.pop();
            },
            child: Text(
              'Got it',
              style: TextStyles.font14BlueSemiBold,
            ),
          ),
        ],
      ),
    );
  }
}