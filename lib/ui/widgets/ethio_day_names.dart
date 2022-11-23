import 'package:flutter/material.dart';


final List<Text> _days = [
  const Text(
    "ሰ",
    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
  ),
  const Text("ማ", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
  const Text("ረ", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
  const Text("ሐ", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
  const Text("አ", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
  const Text("ቅ", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
  const Text("እ", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
];

class DayNames extends StatelessWidget {
  Widget build(BuildContext context){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: _days.asMap().entries.map((MapEntry map) {
          return Container(
            child: map.value,
          );
        }).toList());

  }
    
  }
