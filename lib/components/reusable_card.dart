import 'package:flutter/material.dart';
class HabitCard extends StatelessWidget {
  HabitCard({required this.cardChild,});
  final cardChild;


  @override
  Widget build(BuildContext context) {
    return Container(
      width:  377,
      height: 71,
      clipBehavior: Clip.hardEdge,
      margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            blurRadius: 1.0,
          ),

        ],
      ),
      child: Container(
        color: Colors.white,
        child: cardChild,
      ),
    );
  }
}