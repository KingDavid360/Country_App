import 'dart:developer';

import 'package:country_app/components%20/continent_filter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../core/api_provider.dart';
import '../core/fliter_provider.dart';
import '../models/country_model.dart';

class BottomSheetItem extends StatefulWidget {
  const BottomSheetItem({super.key});

  @override
  State<BottomSheetItem> createState() => _BottomSheetItemState();
}

class _BottomSheetItemState extends State<BottomSheetItem> {
  // bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    final filterProvider = Provider.of<FilterProvider>(context, listen: false);
    final apiProvider = Provider.of<ApiProvider>(context, listen: false);
    return DraggableScrollableSheet(
      expand: false,
      initialChildSize: 0.35,
      minChildSize: 0.3,
      maxChildSize: 0.9,
      builder: (BuildContext context, ScrollController scrollController) {
        return SingleChildScrollView(
          controller: scrollController,
          child: Column(
            children: [
              ListTile(
                leading: Text(
                  'Filter',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w700),
                ),
                trailing: Container(
                  height: 20,
                  width: 20,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Center(
                      child: Icon(
                        Icons.close_outlined,
                        size: 15,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
              ),
              ExpansionTile(
                title: Text(
                  'Continent',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w700),
                ),
                children: [
                  ListTile(
                    leading: Text(
                      'Africa',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.w500),
                    ),
                    trailing: Checkbox(
                      value: filterProvider.isAfricaChecked,
                      onChanged: (newValue) {
                        filterProvider.changeAfricaCheck(newValue);
                        if (filterProvider.isAfricaChecked == true) {
                          apiProvider.filterCountry('Africa');
                        } else {
                          apiProvider.filterCountryList.forEach((element) {
                            if (element.region!.trim() == 'Africa') {
                              apiProvider.removeFilterList.add(element);
                            }
                          });
                          apiProvider.filterCountryList.removeWhere((element) =>
                              apiProvider.removeFilterList.contains(element));
                        }
                        print(filterProvider.isAfricaChecked);
                        print(apiProvider.filterCountryList);
                      },
                      activeColor: Colors.black,
                    ),
                  ),
                  ListTile(
                    leading: Text(
                      'Asia',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.w500),
                    ),
                    trailing: Checkbox(
                      value: filterProvider.isAsiaChecked,
                      onChanged: (newValue) {
                        filterProvider.changeAsiaCheck(newValue);
                        if (filterProvider.isAsiaChecked == true) {
                          apiProvider.filterCountry('Asia');
                          apiProvider.countryList =
                              apiProvider.filterCountryList;
                        } else {
                          apiProvider.filterCountryList.forEach((element) {
                            if (element.region!.trim() == 'Asia') {
                              apiProvider.removeFilterList.add(element);
                            }
                          });
                          apiProvider.filterCountryList.removeWhere((element) =>
                              apiProvider.removeFilterList.contains(element));
                        }
                        print(filterProvider.isAsiaChecked);
                        print(apiProvider.filterCountryList);
                      },
                      activeColor: Colors.black,
                    ),
                  ),
                  ListTile(
                    leading: Text(
                      'Europe',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.w500),
                    ),
                    trailing: Checkbox(
                      value: filterProvider.isEuropeChecked,
                      onChanged: (newValue) {
                        filterProvider.changeEuropeCheck(newValue);
                        if (filterProvider.isEuropeChecked == true) {
                          apiProvider.filterCountry('Europe');
                        } else {
                          apiProvider.filterCountryList.forEach((element) {
                            if (element.region!.trim() == 'Europe') {
                              apiProvider.removeFilterList.add(element);
                            }
                          });
                          apiProvider.filterCountryList.removeWhere((element) =>
                              apiProvider.removeFilterList.contains(element));
                        }
                        print(filterProvider.isEuropeChecked);
                        print(apiProvider.filterCountryList);
                      },
                      activeColor: Colors.black,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
            ],
          ),
        );
      },
    );
  }
}
