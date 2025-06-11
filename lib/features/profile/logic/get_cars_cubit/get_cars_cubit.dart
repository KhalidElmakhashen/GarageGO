import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:legarage/features/profile/data/repo/get_cars_repo.dart';

part 'get_cars_state.dart';
part 'get_cars_cubit.freezed.dart';

class GetCarsCubit extends Cubit<GetCarsState> {
  GetCarsRepo _getCarsRepo;
  GetCarsCubit(this._getCarsRepo) : super(GetCarsState.initial());

  Future<void> getCars(int userId) async {
    emit(const GetCarsState.loading());
    final response = await _getCarsRepo.getCars(userId);
    response.when(
      success: (data) {
        emit(GetCarsState.success(data));
      },
      failure: (error) {
        emit(GetCarsState.error(error.apiErrorModel.message ?? ''));
      },
    );
  }
}
