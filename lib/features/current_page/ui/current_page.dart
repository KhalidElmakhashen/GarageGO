import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:legarage/core/helpers/constants.dart';
import 'package:legarage/core/widgets/image_back_ground_container.dart';
import 'package:legarage/features/current_page/logic/delete_reservation_cubit/delete_reservation_cubit.dart';
import 'package:legarage/features/current_page/ui/widget/is_reserved_false.dart';
import 'package:legarage/features/current_page/ui/widget/is_reserved_true.dart';

class CurrentPage extends StatelessWidget {
  const CurrentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          'Spot Detials',
          style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),
        ),
        backgroundColor: Colors.transparent,
      ),
      body: Stack(
        children: [
          BlocListener<DeleteReservationCubit, DeleteReservationState>(
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
          ),
          const ImageBackGroundContainer(
            imagePath: 'assets/images/White_gradiant_background.png',
          ),
          isReserved ? const IsReservedTrue() : const IsReservedFalse(),
        ],
      ),
    );
  }
}
