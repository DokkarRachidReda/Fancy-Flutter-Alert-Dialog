import 'package:fancy_dialog/FancyAnimation.dart';
import 'package:fancy_dialog/FancyGif.dart';
import 'package:fancy_dialog/FancyTheme.dart';
import 'package:fancy_dialog/fancy_dialog.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);


  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  

  @override
  Widget build(BuildContext context) {
   
   return Scaffold(
    body: Center(
      child: Column(
     children: <Widget>[
       Padding(padding: EdgeInsets.all(20),),
       Text("data",style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold,fontSize: 30),),
       Padding(padding: EdgeInsets.only(top: 30),
       
       child: Text("hello",style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold,fontSize: 20),),

       ),

       Padding(padding: EdgeInsets.only(top: 50),
       child: RaisedButton(
         onPressed: ()=> {
           showDialog(
              context: context,
              builder: (BuildContext context) => FancyDialog(
                title: "Fancy Gif Dialog",
                descreption: "This is descreption for fancy gif,you can load any image or gif to be displayed :), and you can choose between two themes Fancy and Flat",
                animationType: FancyAnimation.BOTTOM_TOP,
                theme: FancyTheme.FANCY,
                gifPath: FancyGif.MOVE_FORWARD,//'./assets/walp.png',
                okFun: ()=>{print("it's working :)")},
                
                )
            ) 
         },
       ),
       )
     ],
   ),
    )
   );
  }
}
