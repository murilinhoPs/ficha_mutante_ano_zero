import 'package:pdf_mutant/src/widgets/circle_mark/controller/circle_mark_state_holder.dart';

abstract class CircleMarkController {
  CircleMarkStateHolder get state;

  bool get hasClicked;

  void onCircleMarkTapped({bool value});
}
