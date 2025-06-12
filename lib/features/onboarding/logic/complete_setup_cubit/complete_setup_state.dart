part of 'complete_setup_cubit.dart';

@freezed
class CompleteSetupState<T> with _$CompleteSetupState {
  const factory CompleteSetupState.initial() = _Initial;

  const factory CompleteSetupState.loading() = Loading;
  const factory CompleteSetupState.success(T data) = Success<T>;
  const factory CompleteSetupState.error(String message) = Error;

  
}
