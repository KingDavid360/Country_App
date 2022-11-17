import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../models/country_model.dart';

class ApiProvider extends ChangeNotifier {
  bool loading = false;


  bool isAfrica = false;
  bool isAsia = false;
  bool isEurope = false;

  List<CountryApiModel> countryList = [];
  List<CountryApiModel> filterCountryList = [];
  List<CountryApiModel> removeFilterList = [];

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
      countryList = countryApiModelFromJson(response.body);
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
    if (filteredCountry == "Africa") {
      isAfrica = true;
      notifyListeners();
    }if (filteredCountry == "Asia") {
      isAsia = true;
      notifyListeners();
    }if (filteredCountry == "Europe") {
      isEurope = true;
      notifyListeners();
    }
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



  removeCountryFromFilter(String filteredCountry) {
    countryList.forEach((element) {
      if (element.region!.trim().contains(filteredCountry)) {
        filterCountryList.remove(element);
        log("${filterCountryList.length}");
      }
    });
    notifyListeners();
  }
}
