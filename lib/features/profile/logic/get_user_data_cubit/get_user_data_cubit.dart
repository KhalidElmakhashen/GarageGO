import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:legarage/features/profile/data/repo/get_user_data_repo.dart';

part 'get_user_data_state.dart';
part 'get_user_data_cubit.freezed.dart';

class GetUserDataCubit extends Cubit<GetUserDataState> {
  GetUserDataCubit(this._getUserDataRepo) : super(GetUserDataState.initial());

    GetUserDataRepo _getUserDataRepo;

  Future<void> getUserData(int userId) async {
    emit(const GetUserDataState.loading());
    final response = await _getUserDataRepo.getUserData(userId);
    response.when(success: (userData) async {
      emit(GetUserDataState.success(userData));
    }, failure: (error) {
      emit(GetUserDataState.error(error: error.apiErrorModel.message ?? ''));
    });
  }
}
