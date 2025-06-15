import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'current_page_state.dart';
part 'current_page_cubit.freezed.dart';

class CurrentPageCubit extends Cubit<CurrentPageState> {
  CurrentPageCubit() : super(CurrentPageState.initial());


  


}
