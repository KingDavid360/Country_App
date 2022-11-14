import 'package:flutter/cupertino.dart';

class FilterProvider extends ChangeNotifier {
  bool? isChecked;
  FilterProvider({
    this.isChecked = false,
  });
  void changeCheck(value) {
    isChecked = value;
    notifyListeners();
  }
}
