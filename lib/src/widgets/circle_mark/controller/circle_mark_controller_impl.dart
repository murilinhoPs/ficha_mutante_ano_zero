import 'package:ficha_mutante_ano_zero/src/widgets/circle_mark/controller/circle_mark_controller.dart';
import 'package:ficha_mutante_ano_zero/src/widgets/circle_mark/controller/circle_mark_state_holder.dart';

class CircleMarkControllerImpl extends CircleMarkController {
  final _stateHolder = CircleMarkStateHolder();

  @override
  CircleMarkStateHolder get state => _stateHolder;

  @override
  bool get hasClicked => state.hasClickedValue;

  @override
  void onCircleMarkTapped({bool? value}) {
    state.setHasClicked(hasClicked: value ?? !hasClicked);
  }
}
