import 'dart:developer';

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
  @override
  Widget build(BuildContext context) {
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
                    leading: const Text(
                      'Africa',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.w500),
                    ),
                    trailing: Checkbox(
                      value: apiProvider.isAfrica,
                      onChanged: (newValue) {
                        setState(() {
                          apiProvider.isAfrica = !apiProvider.isAfrica;
                        });

                        if (apiProvider.isAfrica) {
                          apiProvider.filterCountry("Africa");
                        } else {
                          apiProvider.removeCountryFromFilter("Africa");
                        }

                        // filterProvider.changeAfricaCheck(newValue);
                        // if (filterProvider.isAfricaChecked!) {
                        //   apiProvider.filterCountry('Africa');
                        // } else {
                        //   // apiProvider.filterCountryList.clear();
                        //   apiProvider.filterCountryList.forEach((element) {
                        //     if (element.region!.trim() == 'Africa') {
                        //       apiProvider.removeFilterList.add(element);
                        //     }
                        //   });
                        //   apiProvider.filterCountryList.removeWhere((element) =>
                        //       apiProvider.removeFilterList.contains(element));
                        // }
                        // print(filterProvider.isAfricaChecked);
                        // print(apiProvider.filterCountryList);
                      },
                      activeColor: Colors.black,
                    ),
                  ),
                  ListTile(
                    leading: const Text(
                      'Asia',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.w500),
                    ),
                    trailing: Checkbox(
                      value: apiProvider.isAsia,
                      onChanged: (newValue) {
                        setState(() {
                          apiProvider.isAsia = !apiProvider.isAsia;
                        });
                        if (apiProvider.isAsia) {
                          apiProvider.filterCountry("Asia");
                          print("Asia toggled");
                        } else {
                          apiProvider.removeCountryFromFilter("Asia");
                        }
                      },
                      activeColor: Colors.black,
                    ),
                  ),
                  ListTile(
                    leading: const Text(
                      'Europe',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.w500),
                    ),
                    trailing: Checkbox(
                      value: apiProvider.isEurope,
                      onChanged: (newValue) {
                        setState(() {
                          apiProvider.isEurope = !apiProvider.isEurope;
                        });
                        if (apiProvider.isEurope) {
                          apiProvider.filterCountry("Europe");
                          print("Europe toggled");
                        } else {
                          apiProvider.removeCountryFromFilter("Europe");
                        }
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
