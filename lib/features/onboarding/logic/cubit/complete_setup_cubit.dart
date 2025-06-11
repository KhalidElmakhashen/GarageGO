import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:legarage/features/onboarding/data/models/add_new_car_request.dart';
import 'package:legarage/features/onboarding/data/repo/add_new_car_repo.dart';

part 'complete_setup_state.dart';
part 'complete_setup_cubit.freezed.dart';

class CompleteSetupCubit extends Cubit<CompleteSetupState> {
  AddNewCarRepo _addNewCarRepo;
  CompleteSetupCubit(this._addNewCarRepo) : super(CompleteSetupState.initial());


  final TextEditingController carModelController = TextEditingController();
  final TextEditingController plateNumberController = TextEditingController();
  final TextEditingController carTypeController = TextEditingController();



  Future<void> addNewCar(int userId) async {
    emit(const CompleteSetupState.loading());
    final response = await _addNewCarRepo.addNewCar(
      AddNewCarRequest(
        plateNumber: plateNumberController.text,
        model: carModelController.text,
        type: carTypeController.text,
        // plateNumber: "vr-1234",
        // model: 'Toyota',
        // type: 'Sedan',
        userId: userId
      )
    );
    response.when(
      success: (data) {
        emit(CompleteSetupState.success(data));
      },
      failure: (error) {
        emit(CompleteSetupState.error(error.apiErrorModel.message ?? ''));
      },
    );
  }
}
