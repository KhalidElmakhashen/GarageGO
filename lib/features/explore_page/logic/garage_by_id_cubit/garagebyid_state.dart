part of 'garagebyid_cubit.dart';

@freezed
class GaragebyidState<T> with _$GaragebyidState {
  const factory GaragebyidState.initial() = _Initial;

  const factory GaragebyidState.loading() = Loading;
  const factory GaragebyidState.success(T data) = Success<T>;
  const factory GaragebyidState.error({required String error}) = Error;
}
