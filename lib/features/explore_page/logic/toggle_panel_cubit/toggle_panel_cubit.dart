
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class TogglePanelCubit extends Cubit<void> {
  TogglePanelCubit() : super(null);

  PanelController panelController = PanelController();

  void togglePanel() => panelController.isPanelOpen
      ? panelController.close()
      : panelController.open();

  void openPanel() => panelController.open();
  void closePanel() => panelController.close();


}
