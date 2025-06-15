// timer_cost_cubit.dart
import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:legarage/core/helpers/shared_pref_helper.dart';

class TimerCostState extends Equatable {
  final Duration elapsed;
  final double cost; // التكلفة بالجنيه أو أي عملة
  const TimerCostState({required this.elapsed, required this.cost});

  factory TimerCostState.initial() =>
      const TimerCostState(elapsed: Duration.zero, cost: 0);

  TimerCostState copyWith({Duration? elapsed, double? cost}) => TimerCostState(
        elapsed: elapsed ?? this.elapsed,
        cost: cost ?? this.cost,
      );

  @override
  List<Object?> get props => [elapsed, cost];
}

class TimerCostCubit extends Cubit<TimerCostState> {
  final double pricePerMinute; //‑‑ كم تكلِّف الدقيقة الواحدة
  TimerCostCubit({required this.pricePerMinute})
      : super(TimerCostState.initial());

  static Future<Duration> getSavedElapsedTime() async {
    final seconds = SharedPrefHelper.getInt('elapsed_seconds') ?? 0;
    return Duration(seconds: seconds);
  }


  /// يُستدعى من الـ Timer أو من onChanged كل ثانية
  void update(Duration newElapsed) async {
    final cost = (newElapsed.inSeconds / 60) * pricePerMinute;
    emit(state.copyWith(elapsed: newElapsed, cost: cost));

    await SharedPrefHelper.setData('elapsed_seconds', newElapsed.inSeconds);
  }

   void reset() async {
    emit(TimerCostState.initial());
    await SharedPrefHelper.removeData('elapsed_seconds');
  }

}
