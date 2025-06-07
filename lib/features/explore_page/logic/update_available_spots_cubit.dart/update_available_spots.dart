


import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:legarage/features/explore_page/logic/garage_by_id_cubit/garagebyid_cubit.dart';

class UpdateAvailableSpotsCubit extends Cubit<int> {
  final GaragebyidCubit _getGarageByIdCubit;
  UpdateAvailableSpotsCubit(this._getGarageByIdCubit) : super(0);

  // int availableSpots = _getGarageByIdCubit.availableSpots;

  // void increment() => emit(state + 1);

  // void decrement() => emit(availableSpots - 1);
}
