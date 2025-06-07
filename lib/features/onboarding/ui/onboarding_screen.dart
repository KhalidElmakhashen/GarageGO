import 'package:flutter/material.dart';
import 'package:legarage/features/onboarding/ui/widgets/step_1_content.dart';
import 'package:legarage/features/onboarding/ui/widgets/step_2_content.dart';
import 'package:legarage/features/onboarding/ui/widgets/step_3_content.dart';
import 'package:legarage/core/theming/text_styles.dart';
import 'package:legarage/features/onboarding/ui/widgets/step_4_content.dart';

class OnboardingScreen extends StatefulWidget {
 const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int currentStep = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text(''),
      ),
      body: Stepper(
        physics: const
         BouncingScrollPhysics(),

        type:  StepperType.vertical,

        controlsBuilder: (context, details) {
          return const SizedBox.shrink();
        },
        steps: getSteps(),
        currentStep: currentStep,
        onStepTapped: (value) => setState(() {
          currentStep = value;
        }),
      ),
    );
  }

  List<Step> getSteps() {
    return [
      Step(
        stepStyle: currentStep >= 0 ? const StepStyle(color: Colors.blue) : const StepStyle(),
        state: currentStep > 0 ? StepState.complete : StepState.indexed,
        isActive: currentStep >= 0,
        title: Text(
          'Welcome',
          style: TextStyles.font24BlueBold
        ),
        content: const Step1Content(),
      ),
      Step(
        stepStyle: currentStep >= 1 ? const StepStyle(color: Colors.blue) : const StepStyle(),
        state: currentStep > 1 ? StepState.complete : StepState.indexed,
        isActive: currentStep >= 1,
        title: Text(
          'Car Information',
          style: TextStyles.font24BlueBold
        ),
        content: Step2Content(),
      ),
      Step(
        stepStyle: currentStep >= 2 ? const  StepStyle(color: Colors.blue) : const  StepStyle(),
        state: currentStep > 2 ? StepState.complete : StepState.indexed,
        isActive: currentStep >= 2,
        title: Text(
          'Profile Picture',
          style: TextStyles.font24BlueBold
        ),
        content: Step3Content(),
      ),
      Step(
        stepStyle: currentStep >= 3 ? const StepStyle(color: Colors.blue) : const StepStyle(),
        state: currentStep > 3 ? StepState.complete : StepState.indexed,
        isActive: currentStep >= 3,
        title: Text(
          'All Set!',
          style: TextStyles.font24BlueBold
        ),
        content: const Step4Content(),
      ),
    ];
  }
}
