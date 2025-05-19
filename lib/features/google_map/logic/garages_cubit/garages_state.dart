part of 'garages_cubit.dart';

@freezed
class GaragesState<T> with _$GaragesState<T> {
  const factory GaragesState.initial() = _Initial;

  
  const factory GaragesState.loading() = Loading;
  const factory GaragesState.success(T data) = Success<T>;
  // const factory GaragesState.selectedGarage(Map<String, dynamic> selectedGarageData) = SelectedGarage;
  const factory GaragesState.error({required String error}) = Error;
}
