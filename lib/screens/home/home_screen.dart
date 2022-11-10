import 'package:country_app/components%20/filteer_container.dart';
import 'package:country_app/constants.dart';
import 'package:country_app/core/api_provider.dart';
import 'package:country_app/screens/detail/detail_scren.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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

  @override
  Widget build(BuildContext context) {
    final apiProvider = Provider.of<ApiProvider>(context);
    var model = apiProvider.countryList;
    model.sort((a, b) => a.name!.common!.compareTo(b.name!.common!));
    return Scaffold(
      backgroundColor: KSecondaryColor,
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
                                      color: KPrimaryColor,
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
                              color: KPrimaryColor,
                            )
                          ],
                        ),
                        const SizedBox(height: 30),
                        Container(
                          height: 55,
                          width: MediaQuery.of(context).size.width * 0.9,
                          color: Colors.grey[100],
                          child: ListTile(
                            leading: Icon(
                              Icons.search,
                              color: KPrimaryColor,
                            ),
                            title: Padding(
                              padding: const EdgeInsets.only(left: 30.0),
                              child: Text('Search Country',
                                  style: TextStyle(
                                      fontSize: 22,
                                      color: KPrimaryColor,
                                      fontWeight: FontWeight.w200)),
                            ),
                          ),
                        ),
                        SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            FilterContainer(
                                text: 'EN', icon: Icons.language_outlined),
                            FilterContainer(
                                text: 'Filter', icon: Icons.filter_alt_outlined)
                          ],
                        ),
                      ],
                    ),
                    Expanded(
                      child: ListView.builder(
                          // shrinkWrap: true,
                          itemCount: model.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => DetailScreen(index),
                                  ),
                                );
                              },
                              child: ListTile(
                                leading: Container(
                                  height: 50,
                                  width: 50,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.network(
                                      "${model.elementAt(index).flags?.png}",
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                title: Text(
                                  "${model.elementAt(index).name?.common}",
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: KPrimaryColor,
                                      fontWeight: FontWeight.w700),
                                ),
                                subtitle: Text(
                                  "${model.elementAt(index).capital}",
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: KPrimaryColor,
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
