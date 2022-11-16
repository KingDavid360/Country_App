import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../models/country_model.dart';

class ApiProvider extends ChangeNotifier {
  bool loading = false;
  List<CountryApiModel> countryList = [];
  List<CountryApiModel> constantCountryList = [];
  List<CountryApiModel> filterCountryList = [];

  Future<bool> fetchCountries() async {
    loading = true;
    http.Response response;
    log("fetching application called");

    response = await http.get(
      Uri.parse("https://restcountries.com/v3.1/all"),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json'
      },
    );
    if (response.statusCode == 200) {
      loading = false;
      var res = jsonDecode(response.body);
      countryList =
          constantCountryList = countryApiModelFromJson(response.body);
      print(response.body.toString());
      notifyListeners();
      return true;
    } else {
      print(response.body.toString());
      loading = false;
      notifyListeners();
      return false;
    }
  }

  filterCountry(String filteredCountry) {
    countryList.forEach((element) {
      if (element.region!.trim().contains(filteredCountry)) {
        filterCountryList.add(element);

        log("data from search: ${filteredCountry.length}");
      }
      filterCountryList
          .sort((a, b) => a.name!.common!.compareTo(b.name!.common!));
    });
    notifyListeners();
  }
}
