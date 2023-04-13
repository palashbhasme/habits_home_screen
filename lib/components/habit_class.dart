import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:habits_home_screen/constants.dart';
import 'package:habits_home_screen/components/habit_status_icons.dart';
class HabitDetails{
   String habit_name;
   String habit_description;
   int status_icon;
   IconData habit_icon;
   Color? color;


   HabitDetails( this.habit_name, this.habit_description, this.status_icon,
      this.habit_icon);

   Color? get_color(){
     if(habit_icon == Icons.directions_walk)
       return kDirectionWalkingYellow;

     else if(habit_icon == Icons.nightlight){
       return kSleepEarlyBlue;
     }
   }


}