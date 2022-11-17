import 'package:flutter/cupertino.dart';

class FilterProvider extends ChangeNotifier {
  bool? isAfricaChecked;
  bool? isAntarcticaChecked;
  bool? isAsiaChecked;
  bool? isEuropeChecked;
  bool? isNorthAmericaChecked;
  bool? isAnyChecked;
  FilterProvider(
      {this.isAfricaChecked = false,
      this.isAntarcticaChecked = false,
      this.isAsiaChecked = false,
      this.isEuropeChecked = false,
      this.isNorthAmericaChecked = false,
      this.isAnyChecked = false});
  bool? changeAfricaCheck(value) {
    isAfricaChecked = value;
    isAnyChecked = value;
    notifyListeners();
    return isAfricaChecked;
  }

  bool? changeAntarcticaCheck(value) {
    isAntarcticaChecked = value;
    isAnyChecked = value;
    notifyListeners();
    return isAntarcticaChecked;
  }

  bool? changeAsiaCheck(value) {
    isAsiaChecked = value;
    isAnyChecked = value;
    notifyListeners();
    return isAsiaChecked;
  }

  bool? changeEuropeCheck(value) {
    isEuropeChecked = value;
    isAnyChecked = value;
    notifyListeners();
    return isEuropeChecked;
  }

  bool? changeNorthAmericaCheck(value) {
    isNorthAmericaChecked = value;
    isAnyChecked = value;
    notifyListeners();
    return isNorthAmericaChecked;
  }
}
