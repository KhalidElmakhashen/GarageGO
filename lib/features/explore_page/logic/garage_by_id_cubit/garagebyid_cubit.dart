import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:legarage/features/explore_page/data/repo/get_garage_by_id_repo.dart';


part 'garagebyid_state.dart';
part 'garagebyid_cubit.freezed.dart';

class GaragebyidCubit extends Cubit<GaragebyidState> {
  GaragebyidCubit(this._getGarageById) : super(GaragebyidState.initial());

  GetGarageByIdRepo  _getGarageById;

  int availableSpots = 0;

  Future<void> getGarageById(int id) async {
    emit(const GaragebyidState.loading());
    final response = await _getGarageById.getGarageById(id);
    response.when(success: (getGarageById) async {
        availableSpots = getGarageById.garageData!.availableSpots;
        emit(GaragebyidState.success(getGarageById));
    }, failure: (error) {
      emit(GaragebyidState.error(error: error.apiErrorModel.message ?? ''));
    });
  }
}
