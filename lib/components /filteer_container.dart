import 'package:country_app/core/fliter_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants.dart';

class FilterContainer extends StatefulWidget {
  final String text;
  final IconData icon;

  const FilterContainer({super.key, required this.text, required this.icon});

  @override
  State<FilterContainer> createState() => _FilterContainerState();
}

bool? isChecked = false;

class _FilterContainerState extends State<FilterContainer> {
  @override
  Widget build(BuildContext context) {
    // int? radioValue = Provider.of<FilterProvider>(context).isOn;

    return TextButton(
      onPressed: () {
        showBottomSheet<dynamic>(
            context: context,
            builder: (BuildContext context) {
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
                        Checkbox(
                          value: isChecked,
                          onChanged: (newValue) {
                            setState(() {
                              isChecked = newValue;
                            });
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
      },
      child: Container(
        height: 45,
        width: 85,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Color(0xffC0C0C0))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(
              widget.icon,
              size: 25,
              color: KPrimaryColor,
            ),
            Text(widget.text,
                style: TextStyle(
                    fontSize: 18,
                    color: KPrimaryColor,
                    fontWeight: FontWeight.w700)),
          ],
        ),
      ),
    );
  }
}
