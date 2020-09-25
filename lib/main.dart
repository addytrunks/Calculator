import 'package:math_expressions/math_expressions.dart';
import 'package:flutter/material.dart';
import 'calc_button.dart';
import 'constants.dart';

void main(){
  runApp(CalcApp());
}

class CalcApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black,
        primaryColor: Colors.black
      ),
      debugShowCheckedModeBanner: false,
      home: CalcInputApp(),
    );
  }
}

class CalcInputApp extends StatefulWidget {
  @override
  _CalcInputAppState createState() => _CalcInputAppState();
}

class _CalcInputAppState extends State<CalcInputApp> {
  String exp = '';
  String hist = '';

  void numClick(String text){
    setState(() {
        exp += text;
    });
  }

  void allClear(String text){
    setState(() {
      exp = '';
      hist = '';
    });
  }

  void clear(String text){
    setState(() {
      exp = '';
    });
  }

  void evaluate(String text){
    exp = exp.replaceAll('×', '*');
    exp = exp.replaceAll('÷', '/');
    exp = exp.replaceAll('−','-');
    Parser p = Parser();
    Expression expo = p.parse(exp);
    ContextModel cm = ContextModel();

    setState(() {
      hist = exp;
      exp = expo.evaluate(EvaluationType.REAL, cm).toStringAsFixed(2);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            alignment: Alignment.centerRight,
              margin: EdgeInsets.symmetric(horizontal: 30),
              child: Text(hist,style:TextStyle(fontFamily: 'Arimo',fontSize: 28,color:Colors.grey[800] )),
          ),
          Container(
            alignment: Alignment.bottomRight,
            margin: EdgeInsets.all(30),
            child: Text(exp,style:TextStyle(fontFamily: 'Arimo',fontSize: 60)),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CalcButton(backgroundColor: buttoncolor3,text: 'AC',textColor: textColor,callback: allClear,),
              CalcButton(backgroundColor: buttoncolor3,text: 'C',textColor: textColor,callback: clear,),
              CalcButton(backgroundColor: buttoncolor3,text: '%',textColor: textColor,callback: numClick),
              CalcButton(backgroundColor: buttoncolor,text: '÷',callback: numClick),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CalcButton(backgroundColor: buttoncolor2,text: '7',callback: numClick),
              CalcButton(backgroundColor: buttoncolor2,text: '8',callback: numClick),
              CalcButton(backgroundColor: buttoncolor2,text: '9',callback: numClick),
              CalcButton(backgroundColor: buttoncolor,text: '×',callback: numClick),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CalcButton(backgroundColor: buttoncolor2,text: '4',callback: numClick),
              CalcButton(backgroundColor: buttoncolor2,text: '5',callback: numClick),
              CalcButton(backgroundColor: buttoncolor2,text: '6',callback: numClick),
              CalcButton(backgroundColor: buttoncolor,text: '−',callback: numClick),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CalcButton(backgroundColor: buttoncolor2,text: '3',callback: numClick),
              CalcButton(backgroundColor: buttoncolor2,text: '2',callback: numClick),
              CalcButton(backgroundColor: buttoncolor2,text: '1',callback: numClick),
              CalcButton(backgroundColor: buttoncolor,text: '+',callback: numClick),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CalcButton(backgroundColor: buttoncolor2,text: '0',callback: numClick),
              CalcButton(backgroundColor: buttoncolor2,text: '00',callback: numClick),
              CalcButton(backgroundColor: buttoncolor2,text: '.',callback: numClick),
              CalcButton(backgroundColor: buttoncolor,text: '=',callback: evaluate),
            ],
          )
        ],
      )
    );
  }
}