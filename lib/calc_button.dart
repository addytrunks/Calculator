import 'package:flutter/material.dart';


class CalcButton extends StatelessWidget {
  final String text;
  final Function callback;
  final Color backgroundColor;
  final Color textColor;

  CalcButton({this.text,this.callback,this.backgroundColor,this.textColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: RawMaterialButton(
        child: Text(text,),
        fillColor: backgroundColor,
        splashColor: Colors.blue[300],
        onPressed:() => callback(text),
        shape: CircleBorder(),
        constraints: BoxConstraints.tightFor(
          width: 72.0,
          height: 72.0,
        ),
        elevation: 0,
        focusElevation: 2.07,
       textStyle:TextStyle(
         fontSize: 35.0,
         color: textColor,
       ),
      ),
    );
  }
}


