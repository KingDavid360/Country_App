import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../components /filteer_container.dart';
import '../../components /user_image_icon.dart';
import '../../core/api_provider.dart';
import '../../models/country_model.dart';
import '../detail/detail_scren.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final apiProvider = Provider.of<ApiProvider>(context, listen: false);
    apiProvider.fetchCountries();
  }

  bool isChecked = false;
  bool searchAvailable = false;

  List<CountryApiModel> searchedCountry = [];

  var searchController = TextEditingController();

  searchCountry(String searchedWord) {
    final apiProvider = Provider.of<ApiProvider>(context, listen: false);

    apiProvider.countryList.forEach((element) {
      if (element.name!.common!.contains(searchedWord)) {
        searchedCountry.add(element);
        searchAvailable = true;
        log("data from search: ${searchedCountry.length}");
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final apiProvider = Provider.of<ApiProvider>(context);
    var model = apiProvider.countryList;

    model.sort((a, b) => a.name!.common!.compareTo(b.name!.common!));

    return Scaffold(
      backgroundColor: Colors.white,
      body: apiProvider.loading
          ? Center(child: CircularProgressIndicator())
          : SafeArea(
              child: Padding(
                padding:
                    const EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
                child: Column(
                  children: [
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RichText(
                                text: const TextSpan(children: [
                              TextSpan(
                                  text: 'Explore',
                                  style: TextStyle(
                                      fontSize: 30,
                                      fontFamily: 'ElsieSwashCaps',
                                      color: Colors.black,
                                      fontWeight: FontWeight.w900)),
                              TextSpan(
                                  text: '.',
                                  style: TextStyle(
                                      fontSize: 30,
                                      color: Color(0xffFF6C00),
                                      fontWeight: FontWeight.w900))
                            ])),
                            const Icon(
                              Icons.light_mode_outlined,
                              color: Colors.black,
                            )
                          ],
                        ),
                        const SizedBox(height: 30),
                        TextFormField(
                          controller: searchController,
                          // onChanged: (value) {
                          //   searchCountry(value);
                          // },
                          onFieldSubmitted: (value) {
                            searchCountry(value);
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            filled: true,
                            hintText: "Search Country",
                            suffixIcon: searchController.text.isNotEmpty
                                ? InkWell(
                                    onTap: () {
                                      setState(() {
                                        searchedCountry.clear();
                                        searchController.clear();
                                      });
                                    },
                                    child: Icon(
                                      Icons.close,
                                      color: Colors.black,
                                    ),
                                  )
                                : Icon(Icons.close),
                            fillColor: Color(0xffF2F4F7),
                          ),
                        ),
                        SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            FilterContainer(
                                text: 'EN',
                                icon: Icons.language_outlined,
                                onPressed: () {
                                  showModalBottomSheet<dynamic>(
                                      context: context,
                                      builder: (context) {
                                        return Container(
                                          height: 400,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(10),
                                              topRight: Radius.circular(10),
                                            ),
                                          ),
                                          child: Column(
                                            children: [
                                              ListTile(
                                                leading: Text(
                                                  'Filter',
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.w700),
                                                ),
                                                trailing: Container(
                                                  height: 20,
                                                  width: 20,
                                                  decoration: BoxDecoration(
                                                    color: Colors.grey[200],
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
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
                                                      fontWeight:
                                                          FontWeight.w700),
                                                ),
                                                children: [
                                                  Checkbox(
                                                    value: isChecked,
                                                    onChanged: (newValue) {
                                                      setState(() {
                                                        isChecked = !isChecked;
                                                      });
                                                      print(isChecked);
                                                    },
                                                    activeColor: Colors.black,
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height: 20),
                                            ],
                                          ),
                                        );
                                      });
                                }),
                            // FilterContainer(
                            //     text: 'Filter',
                            //     icon: Icons.filter_alt_outlined),
                          ],
                        ),
                      ],
                    ),
                    Expanded(
                      child: ListView.builder(
                          // shrinkWrap: true,
                          itemCount: searchController.text.isNotEmpty
                              ? searchedCountry.length
                              : model.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => DetailScreen(index),
                                  ),
                                );
                              },
                              child: searchController.text.isNotEmpty
                                  ? ListTile(
                                      leading: CountryAltImage(
                                        imageUrl:
                                            "${searchedCountry.elementAt(index).flags?.png}",
                                        radius: 10,
                                        height: 50,
                                        width: 50,
                                      ),
                                      title: Text(
                                        "${searchedCountry.elementAt(index).name?.common}",
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w700),
                                      ),
                                      subtitle: Text(
                                        "${searchedCountry.elementAt(index).capital?.elementAt(0)}",
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.black,
                                            fontWeight: FontWeight.normal),
                                      ),
                                    )
                                  : ListTile(
                                      leading: CountryAltImage(
                                        imageUrl:
                                            "${model.elementAt(index).flags?.png}",
                                        radius: 10,
                                        height: 50,
                                        width: 50,
                                      ),
                                      title: Text(
                                        "${model.elementAt(index).name?.common}",
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w700),
                                      ),
                                      subtitle: Text(
                                        "${model.elementAt(index).capital?.elementAt(0)}",
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.black,
                                            fontWeight: FontWeight.normal),
                                      ),
                                    ),
                            );
                          }),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
