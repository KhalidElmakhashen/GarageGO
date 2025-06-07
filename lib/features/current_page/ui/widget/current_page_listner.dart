import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:legarage/features/current_page/logic/delete_reservation_cubit/delete_reservation_cubit.dart';

class CurrentPageListner extends StatelessWidget {
  const CurrentPageListner({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<DeleteReservationCubit, DeleteReservationState>(
      listenWhen: (previous, current) =>
          current is Loading || current is Success || current is Error,
      listener: (context, state) {
        state.whenOrNull(
          success: (data) => ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(data.message),
              backgroundColor: Colors.green,
            ),
          ),
          error: (error) => ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(error),
              backgroundColor: Colors.red,
            ),
          ),
        );
      },
      child: Container(),
    );
  }
}
