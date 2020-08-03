import 'dart:ui';
import 'package:flutter_test/flutter_test.dart';
import 'package:fancy_dialog/FancyAnimation.dart';
import 'package:fancy_dialog/FancyGif.dart';
import 'package:fancy_dialog/FancyTheme.dart';
import 'package:fancy_dialog/fancy_dialog.dart';
void main(){

  

    testWidgets('show dialog test', (WidgetTester tester) async {

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
           expect(tester.takeException(),isAssertionError);

     
});
}