import 'package:flutter/widgets.dart';

class CircleMarkStateHolder {
  var hasClicked = ValueNotifier<bool>(false);

  bool get hasClickedValue => hasClicked.value;

  void setHasClicked({@required bool hasClicked}) {
    this.hasClicked.value = hasClicked;
  }
}
