part of 'delete_reservation_cubit.dart';

@freezed
class DeleteReservationState<T> with _$DeleteReservationState {
  const factory DeleteReservationState.initial() = _Initial;

  const factory DeleteReservationState.loading() = Loading;
  const factory DeleteReservationState.success(T data) = Success<T>;
  const factory DeleteReservationState.error({required String error}) = Error;
}
