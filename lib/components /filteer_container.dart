import 'package:flutter/material.dart';

import '../constants.dart';

class FilterContainer extends StatelessWidget {
  final String text;
  final IconData icon;

  const FilterContainer({super.key, required this.text, required this.icon});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
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
              icon,
              size: 25,
              color: KPrimaryColor,
            ),
            Text(text,
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
