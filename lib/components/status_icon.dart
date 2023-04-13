import 'package:flutter/material.dart';
class StatusIcon extends StatefulWidget {
  const StatusIcon({Key? key}) : super(key: key);

  @override
  State<StatusIcon> createState() => _StatusIconState();
}

class _StatusIconState extends State<StatusIcon> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30), color: Colors.yellow),
      child: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.more_horiz,
            color: Colors.black,
          ),
      ),

    );
  }
}
