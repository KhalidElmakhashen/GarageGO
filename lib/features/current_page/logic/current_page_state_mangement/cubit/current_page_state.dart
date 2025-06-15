part of 'current_page_cubit.dart';

@freezed
class CurrentPageState<T> with _$CurrentPageState {
  const factory CurrentPageState.initial() = _Initial;


  const factory CurrentPageState.carIn() = carIn<T>;
  const factory CurrentPageState.carOut() = carOut<T>;

}
