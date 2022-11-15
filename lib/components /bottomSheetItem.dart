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
  }
}
