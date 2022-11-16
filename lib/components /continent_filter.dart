// import 'dart:developer';
//
// import 'package:country_app/core/fliter_provider.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
// import '../core/api_provider.dart';
//
// class ContinentFilter extends StatefulWidget {
//   const ContinentFilter({Key? key, required this.text}) : super(key: key);
//   final String text;
//
//   @override
//   State<ContinentFilter> createState() => _ContinentFilterState();
// }
//
// class _ContinentFilterState extends State<ContinentFilter> {
//   bool isChecked = false;
//   @override
//   Widget build(BuildContext context) {
//     final filterProvider = Provider.of<FilterProvider>(context, listen: false);
//     final apiProvider = Provider.of<ApiProvider>(context, listen: false);
//
//     return ListTile(
//       leading: Text(
//         widget.text,
//         style: TextStyle(
//             fontSize: 20, color: Colors.black, fontWeight: FontWeight.w500),
//       ),
//       trailing: Checkbox(
//         value: filterProvider.isAfricaChecked,
//         onChanged: (newValue) {
//           filterProvider.isAfricaChecked = filterProvider.isAfricaChecked!;
//           filterProvider.changeAfricaCheck(newValue);
//           if (filterProvider.isAfricaChecked == true) {
//             apiProvider.filterCountry(widget.text);
//           }
//           print(filterProvider.isAfricaChecked);
//         },
//         activeColor: Colors.black,
//       ),
//     );
//   }
// }
