
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:legarage/features/current_page/logic/timer_cost_cubit/timer_cost_cubit.dart';
import 'package:slide_countdown/slide_countdown.dart';

class CustomTimerCountUp extends StatelessWidget {
  final Duration initial; // نقطة البدء إن احتجت

  const CustomTimerCountUp({super.key, this.initial = Duration.zero});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            const Text(
              'Elapsed Time',
              style: TextStyle(
                color: Color(0xFF1F3171),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 15),

            /// SlideCountdownSeparated يدعم العدّ التصاعدي مباشرة
            /// عبر الخاصّية countUp وعلى مدى لانهائي بــ infinityCountUp
            SlideCountdownSeparated(
              duration: initial,
              countUp: true,
              infinityCountUp: true,
              showZeroValue: true,
              onChanged: (elapsed) =>
                  context.read<TimerCostCubit>().update(elapsed),
              style: const TextStyle(fontSize: 50, color: Color(0xFF1F3171)),
              separatorStyle:
                  TextStyle(color: Colors.blue[300], fontSize: 45),
              decoration: BoxDecoration(
                color: Colors.blue[50],
                borderRadius: BorderRadius.circular(13),
              ),
            ),

            const SizedBox(height: 15),

            /// مثال على بثّ التكلفة الحيّة
            // BlocBuilder<TimerCostCubit, TimerCostState>(
            //   buildWhen: (prev, curr) => prev.cost != curr.cost,
            //   builder: (context, state) => Text(
            //     "التكلفة حتى الآن: ${state.cost.toStringAsFixed(2)} ج.م",
            //     style: const TextStyle(
            //         fontSize: 20, fontWeight: FontWeight.w600),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
