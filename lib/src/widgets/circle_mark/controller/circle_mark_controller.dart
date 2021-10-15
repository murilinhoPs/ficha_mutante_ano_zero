import 'package:ficha_mutante_ano_zero/src/widgets/circle_mark/controller/circle_mark_state_holder.dart';

abstract class CircleMarkController {
  CircleMarkStateHolder get state;

  bool get hasClicked;

  void onCircleMarkTapped({bool value});
}
