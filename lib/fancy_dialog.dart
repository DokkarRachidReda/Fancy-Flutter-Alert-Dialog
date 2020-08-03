library fancy_dialog;

import 'package:flutter/material.dart';

import 'FancyGif.dart';

const testKeys = [
  Key("fancyButtons"),
  Key("flatButtons")
];

class FancyDialog extends StatefulWidget {
  const FancyDialog(
      {Key key,
      @required this.title,
      @required this.descreption,
      this.okFun,
      this.cancelFun,
      this.animationType = 1,
      this.gifPath = FancyGif.MOVE_FORWARD,
      this.cancelColor = Colors.grey,
      this.okColor = Colors.pink,
      this.ok = " OK !",
      this.cancel = "Cancel",
      this.theme = 0 //default theme is fancy
      })
      : super(key: key);

  final String title;
  final String descreption;
  final Function okFun;
  final Function cancelFun;
  final int animationType;
  final String gifPath;
  final Color okColor;
  final Color cancelColor;
  final String ok;
  final String cancel;
  final int theme; // 0: fancy , 1:flat
  @override
  GifDialogState createState() {
    return GifDialogState();
  }
}

class GifDialogState extends State<FancyDialog> with TickerProviderStateMixin {
  AnimationController ac;
  Animation animation;
  double width;
  double height;
  int animationAxis = 0; // 0 for x 1 for y

  String title;
  String descreption;
  Function okFun;
  Function cancelFun;
  String gifPath;
  Color okColor;
  Color cancelColor;
  String ok;
  String cancel;
  int theme;
  int package = 0; //0 user assets ,1 package assets
  @override
  void initState() {
    title = widget.title;
    descreption = widget.descreption;
    okFun = widget.okFun;
    cancelFun = widget.cancelFun;
    okColor = widget.okColor;
    cancelColor = widget.cancelColor;
    gifPath = widget.gifPath;
    ok = widget.ok;
    cancel = widget.cancel;
    theme = widget.theme;

    if (gifPath == 'CHECK_MAIL') {
      gifPath = 'assets/gif3.gif';
      package = 1;
    } else if (gifPath == 'FUNNY_MAN') {
      gifPath = 'assets/gif1.gif';
      package = 1;
    } else if (gifPath == 'MOVE_FORWARD') {
      gifPath = 'assets/gif4.gif';
      package = 1;
    } else if (gifPath == 'PLAY_MEDIA') {
      gifPath = 'assets/gif2.gif';
      package = 1;
    } else if (gifPath == 'SUBMIT') {
      gifPath = 'assets/gif5.gif';
      package = 1;
    } else if (gifPath == 'SHARE') {
      gifPath = 'assets/gif6.gif';
      package = 1;
    }
    double start;
    int animationType = widget.animationType;
    switch (animationType) {
      case 1:
        {
          start = -1.0;
          break;
        }
      case -1:
        {
          start = 1.0;
          break;
        }
      case 2:
        {
          start = -1.0;
          break;
        }
      case -2:
        {
          start = 1.0;
          break;
        }
    }
    if (animationType.abs() == 2) animationAxis = 1;
    ac =
        AnimationController(vsync: this, duration: Duration(milliseconds: 400));
    animation = Tween(begin: start, end: 0.0)
        .animate(CurvedAnimation(parent: ac, curve: Curves.easeIn));
    animation.addListener(() {
      setState(() {});
    });

    ac.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    var dialogWidth = 0.36 * height;
    
    assert(MediaQuery.of(context,nullOk: true) != null,'\n****context does not contain media query object***\n');
    assert(title!= null,'\n****title is required***\n');
    assert(descreption!= null,'\n****descreption is required***\n');
  
    var image = ClipRRect(
      child: Image.asset(
              gifPath,
              fit: BoxFit.fill,
              width: dialogWidth * 1.1, // dialogWidth will get left/right margin?
              height: dialogWidth * 0.6,
              package: package == 1 ? 'fancy_dialog' : null,
            ),
      borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(theme == 0 ? 15 : 0),
                      topRight: Radius.circular(theme == 0 ? 15 : 0)),
      );

    return GestureDetector(
      onTap: (){Navigator.of(context).pop();},
      child: Dialog(
              shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(theme == 0 ? 15 : 0),
              ),
              elevation: 0.0,
              backgroundColor: Colors.transparent,
              child: Container(
                      width: dialogWidth,
                      transform: Matrix4.translationValues(
                                  animationAxis == 0 ? animation.value * width : 0,
                                  animationAxis == 1 ? animation.value * width : 0,
                                  0
                      ),
                      decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(theme == 0 ? 15 : 0),
                            color: Colors.white,
                            ),
                      child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                        image,
                                        Padding(
                                          padding: const EdgeInsets.all(5),
                                          child: Text(
                                                  title,
                                                  style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 20,
                                                          fontWeight: FontWeight.bold
                                                    ),
                                                  ),
                                          ),
                                          
                                          Padding(
                                            padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                                            child: Container(
                                                    child: Text(
                                                            descreption,
                                                            style: TextStyle(color: Colors.grey[600], fontSize: 15),
                                                            textAlign: TextAlign.center,
                                                            maxLines: 5,
                                                            overflow: TextOverflow.ellipsis,
                                                      ),
                                                  )
                                            ),

                                          Container(
                                            child: Row(
                                                    mainAxisAlignment: theme == 1
                                                    ? MainAxisAlignment.end
                                                    : MainAxisAlignment.center,
                                                    children: <Widget>[
                                                              theme == 0
                                                              ? customButton(cancel, cancelColor, cancelFun)
                                                              : flatButton(cancel, cancelColor, cancelFun),
                                                      
                                                              SizedBox(
                                                                width: 10,
                                                              ),
                                                      
                                                              theme == 0
                                                              ? customButton(ok, okColor, okFun)
                                                              : flatButton(ok, okColor, okFun)
                                                            ],
                                                    ),
                                            )
                                  ],
                              ),
                    ),
              ),
        );
  }

  Widget customButton(String t, Color c, Function f) {
    return 
      Container(
        child: RaisedButton(
                key: testKeys[0],
                shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0)
                      ),
                color: c,
                child: Text(
                        t,
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                
                onPressed: (){
                      f != null ? f() : print("function is null");
                      Navigator.of(context).pop();
                      },
                ),
        );
  }

  Widget flatButton(String t, Color c, Function f) {
    return 
      Container(
        child: FlatButton(
                key: testKeys[1],
                child: Text(
                        t,
                        style: TextStyle(color: c, fontSize: 15),
                      ),
                
                onPressed: (){
                    f != null ? f() : print("function is null");
                    Navigator.of(context).pop();
                    },
                ),
          );
   }

}
