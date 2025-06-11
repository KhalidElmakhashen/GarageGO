part of 'get_cars_cubit.dart';

@freezed
class GetCarsState<T> with _$GetCarsState {
  const factory GetCarsState.initial() = _Initial;

  const factory GetCarsState.loading() = Loading;
  const factory GetCarsState.success(T data) = Success<T>;
  const factory GetCarsState.error(String message) = Error;
}
