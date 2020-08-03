import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fancy_dialog/FancyAnimation.dart';
import 'package:fancy_dialog/FancyGif.dart';
import 'package:fancy_dialog/FancyTheme.dart';
import 'package:fancy_dialog/fancy_dialog.dart';
import '../demo/lib/main.dart';
void main(){

  
    group('assertions test', (){

      testWidgets('null context test', (WidgetTester tester) async {
        
       try{
         await tester.pumpWidget(
              FancyDialog(
                title: "Fancy Gif Dialog",
                descreption:"This is descreption for fancy gif,you can load any image or gif to be displayed :), and you can choose between two themes Fancy and Flat",
                animationType: FancyAnimation.BOTTOM_TOP,
                theme: FancyTheme.FANCY,
                gifPath: FancyGif.MOVE_FORWARD, //'./assets/walp.png',
                okFun: (){print("it's working :)");},
              )
           );

           await tester.pump(Duration(seconds: 3));
           
           
           expect(tester.takeException(),isException);
       }catch(err){
         
       }
          
       });


       testWidgets('null title test test', (WidgetTester tester) async {

        try{
          
          await tester.pumpWidget(
              FancyDialog(
                descreption:"This is descreption for fancy gif,you can load any image or gif to be displayed :), and you can choose between two themes Fancy and Flat",
                animationType: FancyAnimation.BOTTOM_TOP,
                theme: FancyTheme.FANCY,
                gifPath: FancyGif.MOVE_FORWARD, //'./assets/walp.png',
                okFun: (){print("it's working :)");},
              )
           );
          
           await tester.pump(Duration(seconds: 3));
           expect(tester.takeException(),isAssertionError);

        }catch(err){}

     
       });


       testWidgets('null descreption test test', (WidgetTester tester) async {

        try{
          await tester.pumpWidget(
              FancyDialog(
                title: "",
                animationType: FancyAnimation.BOTTOM_TOP,
                theme: FancyTheme.FANCY,
                gifPath: FancyGif.MOVE_FORWARD, //'./assets/walp.png',
                okFun: (){print("it's working :)");},
              )
           );
          
           await tester.pump(Duration(seconds: 3));
           expect(tester.takeException(),isAssertionError);
        }catch(err){}

     
       });

    });


    group('test ui buttons', (){
    

    testWidgets('test fancy dialog', (WidgetTester tester) async {

           await tester.pumpWidget(MyApp());
          
           await tester.pump(Duration(seconds: 3));

           expect(find.byKey(keys[0]),findsOneWidget);

           // make sure the main page is rendred
           await tester.tap(find.byKey(keys[0]));

           await tester.pumpAndSettle();
           
           // make sure the button click worked and the dialog is shown
           expect(find.byType(FancyDialog), findsOneWidget);

           // make sure there are 2 fancy buttons
           expect(find.byKey(testKeys[0]), findsWidgets);
           
           // make sure there are 0 flat buttons
           expect(find.byKey(testKeys[1]), findsNothing);

     
       });


       testWidgets('test flat dialog', (WidgetTester tester) async {

           await tester.pumpWidget(MyApp());
          
           await tester.pump(Duration(seconds: 3));

           expect(find.byKey(keys[1]),findsOneWidget);

           // make sure the main page is rendred
           await tester.tap(find.byKey(keys[1]));

           await tester.pumpAndSettle();
           
           // make sure the button click worked and the dialog is shown
           expect(find.byType(FancyDialog), findsOneWidget);

           // make sure there are 2 flat buttons
           expect(find.byKey(testKeys[1]), findsWidgets);
           
           // make sure there are 0 fancy buttons
           expect(find.byKey(testKeys[0]), findsNothing);

     
       });
    

    });


    
}