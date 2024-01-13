import 'dart:math';

import 'package:flutter/material.dart';

class ClockDialPainter extends CustomPainter{
  final clockText;

  final hourTickMarkLength= 10.0;
  final minuteTickMarkLength = 5.0;

  final hourTickMarkWidth= 3.0;
  final minuteTickMarkWidth = 1.5;

  final Paint tickPaint;
  final TextPainter textPainter;
  final TextStyle textStyle;

  final romanNumeralList= [ 12,1,2,3,4,5,6,7,8,9,10,11];

  ClockDialPainter({this.clockText= ClockText.roman})
      :tickPaint=  Paint(),
        textPainter=  TextPainter(
          textAlign: TextAlign.center,
          textDirection: TextDirection.rtl,
        ),
        textStyle= const TextStyle(
          color: Colors.white,
          //fontFamily: 'Times New Roman',
          fontSize: 18.0,
          fontWeight: FontWeight.bold
        )
  {
    tickPaint.color= Colors.white60;
  }

  @override
  void paint(Canvas canvas, Size size) {
    var tickMarkLength;
    final angle= 2* pi / 60;
    final radius= size.width/2;
    canvas.save();


    canvas.translate(radius, radius);
    for (var i = 0; i< 60; i++ ) {


      tickMarkLength = i % 5 == 0 ? hourTickMarkLength: minuteTickMarkLength;
      tickPaint.strokeWidth= i % 5 == 0 ? hourTickMarkWidth : minuteTickMarkWidth;
      canvas.drawLine(
          new Offset(0.0, -radius), new Offset(0.0, -radius+tickMarkLength), tickPaint);


      //draw the text
      if (i%5==0){
        canvas.save();
        canvas.translate(0.0, -radius+20.0);

        textPainter.text= new TextSpan(
          text: this.clockText==ClockText.roman?
          '${romanNumeralList[i~/5]}'
              :'${i == 0 ? 12 : i~/5}'
          ,
          style: textStyle,
        );

        //helps make the text painted vertically
        canvas.rotate(-angle*i);

        textPainter.layout();


        textPainter.paint(canvas, new Offset(-(textPainter.width/2), -(textPainter.height/2)));

        canvas.restore();

      }

      canvas.rotate(angle);
    }

    canvas.restore();

  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

enum ClockText {
  roman,
  arabic
}