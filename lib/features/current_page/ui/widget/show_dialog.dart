
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';        
import 'package:legarage/core/helpers/extensions.dart';
import 'package:legarage/core/routing/routes.dart';
import 'package:legarage/features/current_page/logic/timer_cost_cubit/timer_cost_cubit.dart';

/*--------------------------------------------------
|  SuccessDialog (الرئيسي)
--------------------------------------------------*/
class SuccessDialog extends StatelessWidget {
  const SuccessDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Thanks'),
      content: const _SuccessDialogBody(),
      actions: const [
        _ContinueButton(),
      ],
    );
  }
}

/*--------------------------------------------------
|  جسم الـ Dialog (نص التكلفة)
--------------------------------------------------*/
class _SuccessDialogBody extends StatelessWidget {
  const _SuccessDialogBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ListBody(
        children: [
          BlocSelector<TimerCostCubit, TimerCostState, double>(
            selector: (s) => s.cost,
            builder: (_, cost) => Text(
              'We Home To See You Soon.\n'
              'Total Cost Is: ${cost.toStringAsFixed(2)} E\u00A3',
              style: TextStyle(
                fontSize: 20,
                color: Theme.of(context).colorScheme.inversePrimary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/*--------------------------------------------------
|  زر المتابعة
--------------------------------------------------*/
class _ContinueButton extends StatelessWidget {
  const _ContinueButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: Colors.blue,
        disabledForegroundColor: Colors.grey.withOpacity(0.38),
      ),
      onPressed: () => context.pushNamed(Routes.homeScreen),
      child: const Text('Continue'),
    );
  }
}
