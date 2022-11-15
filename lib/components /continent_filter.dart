import 'package:flutter/material.dart';

class ContinentFilter extends StatefulWidget {
  const ContinentFilter({Key? key, required this.text}) : super(key: key);
  final String text;

  @override
  State<ContinentFilter> createState() => _ContinentFilterState();
}

class _ContinentFilterState extends State<ContinentFilter> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(
        widget.text,
        style: TextStyle(
            fontSize: 20, color: Colors.black, fontWeight: FontWeight.w500),
      ),
      trailing: Checkbox(
        value: isChecked,
        onChanged: (newValue) {
          setState(() {
            isChecked = !isChecked;
          });
          print(isChecked);
        },
        activeColor: Colors.black,
      ),
    );
  }
}
