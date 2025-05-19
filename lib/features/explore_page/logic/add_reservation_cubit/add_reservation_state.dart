part of 'add_reservation_cubit.dart';

@freezed
class AddReservationState<T> with _$AddReservationState {
  const factory AddReservationState.initial() = _Initial;

  const factory AddReservationState.loading() = Loading;
  const factory AddReservationState.success(T data) = Success<T>;
  const factory AddReservationState.error({required String error}) = Error;
}
