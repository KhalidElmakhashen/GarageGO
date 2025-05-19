import 'package:bloc/bloc.dart';
import 'package:legarage/features/explore_page/logic/update_ui_cubit/update_ui_state.dart';



class UpdateUiCubit extends Cubit<UpdateUiState> {
  UpdateUiCubit() : super(UpdateUiInitial());


  void updateUi() {
    emit(UpdateUiSuccess());
  }
}
