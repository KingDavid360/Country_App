import 'package:flutter/cupertino.dart';

class FilterProvider extends ChangeNotifier {
  bool? isAfricaChecked;
  bool? isAntarcticaChecked;
  bool? isAsiaChecked;
  bool? isEuropeChecked;
  bool? isNorthAmericaChecked;
  FilterProvider({
    this.isAfricaChecked = false,
    this.isAntarcticaChecked = false,
    this.isAsiaChecked = false,
    this.isEuropeChecked = false,
    this.isNorthAmericaChecked = false,
  });
  bool? changeAfricaCheck(value) {
    isAfricaChecked = value;
    notifyListeners();
    return isAfricaChecked;
  }

  bool? changeAntarcticaCheck(value) {
    isAntarcticaChecked = value;
    notifyListeners();
    return isAntarcticaChecked;
  }

  bool? changeAsiaCheck(value) {
    isAsiaChecked = value;
    notifyListeners();
    return isAsiaChecked;
  }

  bool? changeEuropeCheck(value) {
    isEuropeChecked = value;
    notifyListeners();
    return isEuropeChecked;
  }

  bool? changeNorthAmericaCheck(value) {
    isNorthAmericaChecked = value;
    notifyListeners();
    return isNorthAmericaChecked;
  }
}
