part of 'get_user_data_cubit.dart';

@freezed
class GetUserDataState<T> with _$GetUserDataState {
  const factory GetUserDataState.initial() = _Initial;

    const factory GetUserDataState.loading() = Loading;
  const factory GetUserDataState.success(T data) = Success<T>;
  const factory GetUserDataState.error({required String error}) = Error;
}
