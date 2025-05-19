import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:legarage/core/helpers/constants.dart';
import 'package:legarage/core/helpers/shared_pref_helper.dart';
import 'package:legarage/features/current_page/data/repo/delete_reservation_repo.dart';

part 'delete_reservation_state.dart';

part 'delete_reservation_cubit.freezed.dart';

class DeleteReservationCubit extends Cubit<DeleteReservationState> {
  DeleteReservationCubit(this._deleteReservationRepo) : super(DeleteReservationState.initial());

  DeleteReservationRepo _deleteReservationRepo;

  Future<void> deleteReservation(int reservationId) async {
    emit(const DeleteReservationState.loading());
    final response = await _deleteReservationRepo.deleteReservationRecord(reservationId);
    response.when(success: (deleteReservationRespons) async {
      await confirmReserveDeletion(false);
      print(isReserved);
      print("printing the reservation id");
      print(reservationId);
      emit(DeleteReservationState.success(deleteReservationRespons));
    }, failure: (error) {
      emit(DeleteReservationState.error(error: error.apiErrorModel.message ?? ''));
    });
  }

  Future<void> confirmReserveDeletion(bool state) async {
      isReserved = state;
      await SharedPrefHelper.removeData(SharedPrefKeys.reservationId);
  }
}
