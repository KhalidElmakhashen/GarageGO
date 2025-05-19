import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:legarage/core/helpers/spacing.dart';
import 'package:legarage/core/theming/text_styles.dart';
import 'package:legarage/features/auth/login/ui/widgets/terms_and_conditions_text.dart';
import 'package:legarage/features/auth/verifing_email/logic/verification_email_cubit.dart';
import 'package:legarage/features/auth/verifing_email/ui/widgets/verification_digits.dart';
import 'package:legarage/features/auth/verifing_email/ui/widgets/verification_email_bloc_listener.dart';

class VerifingEmailScreen extends StatelessWidget {
  const VerifingEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 60.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Confirming It’s You',
                    style: TextStyles.font24BlueBold,
                  ),
                  verticalSpace(12),
                  Text(
                    'Just a quick check to keep your account safe. It won’t take long — thanks for helping us protect your info!',
                    style: TextStyles.font14GrayRegular,
                  ),
                  verticalSpace(46),
                  VerificationDigits(onCompleted: (verifyCode) {
                    context.read<VerificationEmailCubit>().emitVerificationState(verificationCode: verifyCode);
                  }),
                  verticalSpace(10),
                  Align(
                    alignment: AlignmentDirectional.centerStart,
                    child: Text(
                      'Resend Verification Code',
                      style: TextStyles.font13BlueRegular,
                    ),
                  ),
                ],
              ),
              const TermsAndConditionsText(),
              const VerificationEmailBlocListener(),
            ],
          ),
        ),
      ),
    );
  }
}
