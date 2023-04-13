import 'package:flutter/material.dart';

class HabitWidget extends StatefulWidget {


  @override
  State<HabitWidget> createState() => _HabitWidgetState();
}

class _HabitWidgetState extends State<HabitWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Icon(Icons.directions_walk)
        // Icon(
        //   Icons
        // )

      ],
    );
  }
}


