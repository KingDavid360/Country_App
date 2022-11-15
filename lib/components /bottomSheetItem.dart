import 'package:country_app/components%20/continent_filter.dart';
import 'package:flutter/material.dart';

class BottomSheetItem extends StatefulWidget {
  const BottomSheetItem({super.key});

  @override
  State<BottomSheetItem> createState() => _BottomSheetItemState();
}

class _BottomSheetItemState extends State<BottomSheetItem> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
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
                  ContinentFilter(text: 'Africa'),
                  ContinentFilter(text: 'Antartica'),
                  ContinentFilter(text: 'Asia'),
                  ContinentFilter(text: 'Australia'),
                  ContinentFilter(text: 'Europe'),
                  ContinentFilter(text: 'South America'),
                  ContinentFilter(text: 'North America')
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
