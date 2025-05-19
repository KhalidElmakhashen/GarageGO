import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:legarage/core/helpers/constants.dart';
import 'package:legarage/core/helpers/shared_pref_helper.dart';
import 'package:legarage/features/explore_page/data/repo/reservation_repo.dart';

part 'add_reservation_state.dart';
part 'add_reservation_cubit.freezed.dart';

class AddReservationCubit extends Cubit<AddReservationState> {

  // isReserved = true;
  AddReservationCubit(this._reservationRepo) : super(AddReservationState.initial());

  ReservationRepo _reservationRepo;

    Future<void> addReservationRecord(int userId,int garageId) async {
    emit(const AddReservationState.loading());
    final response = await _reservationRepo.addReservation(userId,garageId);
    response.when(success: (getGarageById) async {
      await confirmRerervation(true, getGarageById.data!.reservationRecordId);
      emit(AddReservationState.success(getGarageById));
    }, failure: (error) {
      emit(AddReservationState.error(error: error.apiErrorModel.message ?? ''));
    });
  }

  Future<void> confirmRerervation(bool state, int reservationId) async {
      await SharedPrefHelper.setData(SharedPrefKeys.reservationId, reservationId.toString());
      isReserved = state;
  }
}

