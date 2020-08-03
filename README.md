# Fancy Flutter Alert Dialog

[![HitCount](http://hits.dwyl.com/DokkarRachidReda/Fancy-Flutter-Alert-Dialog.svg)](http://hits.dwyl.com/DokkarRachidReda/Fancy-Flutter-Alert-Dialog)

[![Build Status](https://travis-ci.com/DokkarRachidReda/Fancy-Flutter-Alert-Dialog.svg?branch=master)](https://travis-ci.com/DokkarRachidReda/Fancy-Flutter-Alert-Dialog) [![Coverage Status](https://coveralls.io/repos/github/DokkarRachidReda/Fancy-Flutter-Alert-Dialog/badge.svg?branch=master)](https://coveralls.io/github/DokkarRachidReda/Fancy-Flutter-Alert-Dialog?branch=master) ![GitHub release (latest by date)](https://img.shields.io/github/v/release/DokkarRachidReda/Fancy-Flutter-Alert-Dialog?style=plastic)


![GitHub stars](https://img.shields.io/github/stars/DokkarRachidReda/Fancy-Flutter-Alert-Dialog?style=social) ![Twitter Follow](https://img.shields.io/twitter/follow/DokkarReda?style=social)

A flutter Package to show custom alert Dialog,you can choose between two themes 'Fancy' and 'Flat'

The package is available in [fancy_dialog](https://pub.dev/packages/fancy_dialog)

## Usage 

### Import the Package 
add this dependencies to your app
``` dependencies: fancy_dialog: ^1.0.1 ```
### Use the Package
add this import statement 
``` import 'package:fancy_dialog/fancy_dialog.dart';```

to show a Basic Dialog

```Dart
showDialog(
              context: context,
              builder: (BuildContext context) => FancyDialog(
                title: "Fancy Gif Dialog",
                descreption: "This is descreption for fancy gif,you can load any image or gif to be displayed :), and you can choose between two themes Fancy and Flat",
                )
            ) 
          
```
         
the  ``` title ``` and ``` descreption ``` are required
 and the rest of the parameters are :
 * ``` okFun ``` : the function to be called when the user press Ok button (positive button)
 * ``` cancelFun ``` : the function to be called when the user press cancel button (negative button)
 * ``` cancelColor ``` : the color of the negative button, by default it's ``` Colors.grey ```
 * ``` oklColor ``` : the color of the positive button, by default it's ``` Colors.pink ```
 * ``` ok ``` : the text of the positive button, by default it's 'OK !'
 * ``` cancel ``` : the text of the negative button, by default it's 'cancel'
 * ``` animationType ``` : The type of the animation, there are 4 types,which are :

      *  ```FancyAnimation.LEFT_RIGHT```    the default one
      *  ``` FancyAnimation.RIGHT_LEFT ```
      *  ``` FancyAnimation.TOP_BOTTOM ``` 
      *  ``` FancyAnimation.BOTTOM_TOP ```
      
 * ``` gifpath ``` : the path for the image or the GIF to be displayed,or you can choose between 6 Gifs the package provides :
      
      * ```FancyGif.MOVE_FORWARD``` the default one
      * ```FancyGif.CHECK_MAIL```
      * ```FancyGif.FUNNY_MAN```
      * ```FancyGif.PLAY_MEDIA```
      * ```FancyGif.SUBMIT```
      * ```FancyGif.SHARE```

 * ``` theme ``` : Fancy or Flat 

     * ``` FancyTheme.FANCY ```
     * ``` FancyTheme.FLAT ```

The dialog will be dissmised by default when the user click Ok or cancel, DON'T ADD 
```Navigator.of(context).pop()``` to  ``` okFun ``` or ``` cancelFun ```

## ScreenShots

<img src="https://github.com/DokkarRachidReda/Fancy-Flutter-Alert-Dialog/blob/master/Screenshots/1.gif" height="420" width="240" hspace="20"><img src="https://github.com/DokkarRachidReda/Fancy-Flutter-Alert-Dialog/blob/master/Screenshots/2_flat.gif" height="420" width="240" hspace="20">

<img src="https://github.com/DokkarRachidReda/Fancy-Flutter-Alert-Dialog/blob/master/Screenshots/3.gif" height="420" width="240" hspace="20"><img src="https://github.com/DokkarRachidReda/Fancy-Flutter-Alert-Dialog/blob/master/Screenshots/4_flat.gif" height="420" width="240" hspace="20">
## Contribution 
Feel free to contribute,report a bug or to suggest a feature

Thank you :)
