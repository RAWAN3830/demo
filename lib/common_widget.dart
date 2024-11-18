import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class commonWidgets extends StatelessWidget {
  final String title;
  final String time;
  const commonWidgets({super.key, required this.title, required this.time});

  @override
  Widget build(BuildContext context) {
    return   Container(
        height: 90,
        width: 90,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          border: Border.all(color: Colors.white),
          gradient: LinearGradient(
              colors: [Colors.blue, Colors.black],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Text(
                title,
                style: TextStyle(color: Colors.white),
              ),
            ),
            Text(
              time,
              // DateTime.now().hour.toString(),
              style: TextStyle(
                  fontSize: 40, color: Colors.white),
            ),
          ],
        ));
  }
}
