


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:legarage/core/helpers/extensions.dart';
import 'package:legarage/core/routing/routes.dart';
import 'package:legarage/core/theming/colors.dart';
import 'package:legarage/features/onboarding/logic/complete_setup_cubit/complete_setup_cubit.dart';


class CompleteSetupListner extends StatelessWidget {
  const CompleteSetupListner({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<CompleteSetupCubit, CompleteSetupState>(
      listenWhen: (previous, current) => 
          current is Success ||
          current is Loading ||
          current is Error,
      listener: (context, state) {
        state.whenOrNull(
          success: (data) {
             context.pop();
            showSuccessDialog(context);
          },
          loading: () {
            showDialog(
              context: context,
              builder: (context) => const Center(
                child: CircularProgressIndicator(
                  color: ColorsManager.mainBlue,
                ),
              ),
            );
          },
          error: (message) {
            context.pop();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(message)),
            );
          },
        );
      },
      child: Container(),
    );
  }
  void showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('complete Setup Successful'),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Congratulations, you have signed up successfully!'),
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
}