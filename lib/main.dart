import 'dart:ffi';
import 'dart:math';
import 'package:clock_app/dial.dart';
import 'package:flutter/material.dart';
import 'dial.dart';
import 'dart:async';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber),
        useMaterial3: true,

      ),
      home: const MyHomePage(title: 'Clock App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
int a = 0;
class _MyHomePageState extends State<MyHomePage> {

  double second = 0;
  double minute = 0;
  double hour = 120 *(DateTime.now().hour-1) + 720;
  int v1 = 0;
  int v2 = 0;
  int v3 = 0;
  int n = 0;
  int m = 0;
  List number = [1,2,3,4,5,6,7,8,9,10,11,12];


  void second_cato()
  {
    Future.delayed(Duration(seconds: 1),(){
      var secondVar = int.parse(DateTime.now().second.toString());
      setState(() {
        var second = ((24*secondVar)+1080);
      });
      second_cato();
    });
  }

  @override
  void initState()
  {
    //TODO: implement initState
    startcount();
    super.initState();
  }

  startcount()
  {
    setState(() {
      Future.delayed(Duration(seconds: 1),() {
        v1 = int.parse(DateTime.now().second.toString());
        v2 = int.parse(DateTime.now().minute.toString());
        v3 = int.parse(DateTime.now().hour.toString());
        print("${DateTime.now().hour} : ${DateTime.now().minute} : ${DateTime.now().second}");

        second = ((24 * v1)+1080);
        minute=(540+(v2*12));
        hour=((48*v3)+450);
        startcount();
      });
    });
  }

  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
        appBar: AppBar(

          backgroundColor: Theme.of(context).colorScheme.inversePrimary,

          title: Text(widget.title),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 45.0,top: 40),
        //  child: Center(

              child: Column(
                children: [
                  Container(
                    height: 300,
                    width: 300,
                    decoration:BoxDecoration(color: Colors.orange,
                        gradient: LinearGradient(colors: [Colors.amber,Colors.red],begin: Alignment.topLeft,end: Alignment.bottomRight),
                        shape:BoxShape.circle,
                        boxShadow:[BoxShadow(color: Colors.red,offset:Offset(10,20),blurRadius: 50)],
                        border: Border.all(color: Colors.transparent,width: 5)),

                   child: Center(
                      child: Stack(
                        children:<Widget> [

                          Align(
                              alignment: Alignment.center,
                              child: Transform.rotate(angle:second *pi/720,
                                child: Divider(
                                  color: Colors.black,
                                  thickness: 2,
                                  indent: 140,
                                  endIndent: 40,
                                ),
                              )//second
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Transform.rotate(angle: minute*pi/360,
                            child: Divider(color: Colors.cyan,thickness: 4,indent: 140,endIndent: 45,),),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Transform.rotate(angle:hour*pi/295,
                            child: Divider(color: Colors.green,thickness: 6,indent: 140,endIndent: 60,),),
                          ),
                          Center(
                            child: Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(color: Colors.red,
                                shape: BoxShape.circle,
                                gradient: RadialGradient(colors:[Colors.red,Colors.orange]),),
                              child:Center(child: Text(DateTime.now().day.toString(), style: TextStyle(fontSize: 25,color: Colors.white,fontWeight: FontWeight.bold),)),
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            height: double.infinity,
                            padding: const EdgeInsets.all(0.0),
                            child: CustomPaint(painter: new ClockDialPainter(clockText : ClockText.roman),),
                          ),
                        ],
                      ),
                   // ),
                  ),
          ),
                  Padding(
                    padding: const EdgeInsets.only(top: 50.0),
                    child: Container(
                      height: 90,
                      width: 300,
                      decoration: BoxDecoration(color: Colors.white,borderRadius:BorderRadius.circular(15)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 14.0),
                      child: Row(
                        children: [
                          Container(
                              height: 90,
                              width: 90,
                              decoration: BoxDecoration(color: Colors.pinkAccent,borderRadius:BorderRadius.circular(50),border: Border.all(color:Colors.white),
                                gradient: LinearGradient(colors: [Colors.amber,Colors.red],begin: Alignment.topLeft,end: Alignment.bottomRight),),
                              child: Column(children: [Padding(
                                padding: const EdgeInsets.only(top: 10.0),
                                child: Text("hour",style:TextStyle(color: Colors.white),),),
                                Text(DateTime.now().hour.toString(), style: TextStyle(fontSize: 40,color: Colors.white),),],)
                          ),

                          Container(
                            height: 90,
                            width: 90,
                            decoration: BoxDecoration(color: Colors.pinkAccent,borderRadius:BorderRadius.circular(50),border: Border.all(color:Colors.white),
                              gradient: LinearGradient(colors: [Colors.amber,Colors.red],begin: Alignment.topLeft,end: Alignment.bottomRight),),
                            child: Column(children: [Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: Text("minute",style:TextStyle(color: Colors.white),),),
                              Text(DateTime.now().minute.toString(), style: TextStyle(fontSize: 40,color: Colors.white),),],)
                          ),

                          Container(
                            height: 90,
                            width: 90,
                            decoration: BoxDecoration(color: Colors.amber,borderRadius:BorderRadius.circular(50),
                              gradient: LinearGradient(colors: [Colors.amber,Colors.red],begin: Alignment.topLeft,end: Alignment.bottomRight),),
                             child: Column(children: [Padding(
                               padding: const EdgeInsets.only(top: 10.0),
                               child: Text("second",style:TextStyle(color: Colors.white),),),
                                      Text(DateTime.now().second.toString(), style: TextStyle(fontSize: 40,color: Colors.white),),],), ),
                        ],
                      ),
                    )),
                  ),
                ],
              ),
        )
    );
  }
}
