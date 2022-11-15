import 'package:card_swiper/card_swiper.dart';
import 'package:country_app/constants.dart';
import 'package:country_app/models/country_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/api_provider.dart';



class DetailScreen extends StatefulWidget {
  final CountryApiModel countryDetails;
  DetailScreen( {super.key, required this.countryDetails});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   final apiProvider = Provider.of<ApiProvider>(context, listen: false);
  //   apiProvider.fetchCountries();
  // }

  @override
  Widget build(BuildContext context) {
    final apiProvider = Provider.of<ApiProvider>(context);
     List<String> imageList = [
      "${widget.countryDetails.flags?.png}",
      "${widget.countryDetails.coatOfArms?.png}",
      // "${model.maps?.googleMaps}"
    ];
    var Size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: KSecondaryColor,
      appBar: AppBar(
        backgroundColor: KSecondaryColor,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: KPrimaryColor,
            size: 35,
          ),
        ),
        centerTitle: true,
        title: Text('${widget.countryDetails.name?.common}',
            style: TextStyle(
                fontSize: 25,
                color: KPrimaryColor,
                fontWeight: FontWeight.w700)),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
          child: ListView(
            children: [
              Container(
                height: Size.height * 0.25,
                width: Size.width,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Swiper(
                  itemCount: imageList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        imageList[index],
                        fit: BoxFit.fill,
                      ),
                    );
                  },
                  pagination: SwiperPagination(),
                  control: SwiperControl(),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Row(
                  children: [
                    Text('Population: ',
                        style: TextStyle(
                            fontSize: 20,
                            color: KPrimaryColor,
                            fontWeight: FontWeight.w700)),
                    Text('${widget.countryDetails.population}',
                        style: TextStyle(
                            fontSize: 18,
                            color: KPrimaryColor,
                            fontWeight: FontWeight.normal)),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Row(
                  children: [
                    Text('Region: ',
                        style: TextStyle(
                            fontSize: 20,
                            color: KPrimaryColor,
                            fontWeight: FontWeight.w700)),
                    Text('${widget.countryDetails.region}',
                        style: TextStyle(
                            fontSize: 18,
                            color: KPrimaryColor,
                            fontWeight: FontWeight.normal)),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Row(
                  children: [
                    Text('Capital: ',
                        style: TextStyle(
                            fontSize: 20,
                            color: KPrimaryColor,
                            fontWeight: FontWeight.w700)),
                    Text('${widget.countryDetails.capital?.elementAt(0)}',
                        style: TextStyle(
                            fontSize: 18,
                            color: KPrimaryColor,
                            fontWeight: FontWeight.normal)),
                  ],
                ),
              ),
              SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Row(
                  children: [
                    Text('Official language: ',
                        style: TextStyle(
                            fontSize: 20,
                            color: KPrimaryColor,
                            fontWeight: FontWeight.w700)),
                    Text('${widget.countryDetails.languages?.eng}',
                        style: TextStyle(
                            fontSize: 18,
                            color: KPrimaryColor,
                            fontWeight: FontWeight.normal)),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Row(
                  children: [
                    Text('Area: ',
                        style: TextStyle(
                            fontSize: 20,
                            color: KPrimaryColor,
                            fontWeight: FontWeight.w700)),
                    Text('${widget.countryDetails.area}',
                        style: TextStyle(
                            fontSize: 18,
                            color: KPrimaryColor,
                            fontWeight: FontWeight.normal)),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Time zone: ',
                        style: TextStyle(
                            fontSize: 20,
                            color: KPrimaryColor,
                            fontWeight: FontWeight.w700)),
                    Expanded(
                      child: Text('${widget.countryDetails.timezones}',
                          style: TextStyle(
                              fontSize: 18,
                              color: KPrimaryColor,
                              fontWeight: FontWeight.normal)),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Row(
                  children: [
                    Text('Dialing code: ',
                        style: TextStyle(
                            fontSize: 20,
                            color: KPrimaryColor,
                            fontWeight: FontWeight.w700)),
                    Text('${widget.countryDetails.idd?.root}',
                        style: TextStyle(
                            fontSize: 18,
                            color: KPrimaryColor,
                            fontWeight: FontWeight.normal)),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Row(
                  children: [
                    Text('Driving side: ',
                        style: TextStyle(
                            fontSize: 20,
                            color: KPrimaryColor,
                            fontWeight: FontWeight.w700)),
                    Text('${widget.countryDetails.car?.side}',
                        style: TextStyle(
                            fontSize: 18,
                            color: KPrimaryColor,
                            fontWeight: FontWeight.normal)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
