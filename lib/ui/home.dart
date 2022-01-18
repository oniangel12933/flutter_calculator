import 'package:calculator_app/ui/math_calculatorButton.dart';
import 'package:calculator_app/ui/symbol_calculatorButton.dart';
import 'package:flutter/material.dart';
import './calculator_button.dart';
import 'package:math_expressions/math_expressions.dart';

class CalcApp extends StatefulWidget {
  CalcApp({Key key}) : super(key: key);

  @override
  CalcAppState createState() => CalcAppState();
}

class CalcAppState extends State<CalcApp> {
  String _history = "";
  String _expression = "";

  void numClick(String text) {
    setState(() {
      _expression += text;
    });
  }

  void allClear(String text) {
    setState(() {
      _history = '';
      _expression = '';
    });
  }

  void clear(String text) {
    setState(() {
      _expression = '';
    });
  }

  void evaluate(String text) {
    Parser p = Parser();
    Expression exp = p.parse(_expression);
    ContextModel cm = ContextModel();

    setState(() {
      _history = _expression;
      _expression = exp.evaluate(EvaluationType.REAL, cm).toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
                padding: EdgeInsets.only(right: 15),
                alignment: Alignment.centerRight,
                child: Text(
                  _history,
                  style: TextStyle(color: Colors.white, fontSize: 24),
                )),
            Container(
                padding: EdgeInsets.all(15),
                alignment: Alignment.centerRight,
                child: Text(
                  _expression,
                  style: TextStyle(color: Colors.white, fontSize: 58),
                )),
            SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ActionCalButton(
                  text: "AC",
                  callback: allClear,
                ),
                ActionCalButton(
                  text: "C",
                  callback: clear,
                ),
                MathCalButton(
                  text: "%",
                  callback: numClick,
                ),
                MathCalButton(
                  text: "/",
                  callback: numClick,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CalButton(
                  text: "7",
                  callback: numClick,
                ),
                CalButton(
                  text: "8",
                  callback: numClick,
                ),
                CalButton(
                  text: "9",
                  callback: numClick,
                ),
                MathCalButton(
                  text: "*",
                  callback: numClick,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CalButton(
                  text: "4",
                  callback: numClick,
                ),
                CalButton(
                  text: "5",
                  callback: numClick,
                ),
                CalButton(
                  text: "6",
                  callback: numClick,
                ),
                MathCalButton(
                  text: "-",
                  callback: numClick,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CalButton(
                  text: "1",
                  callback: numClick,
                ),
                CalButton(
                  text: "2",
                  callback: numClick,
                ),
                CalButton(
                  text: "3",
                  callback: numClick,
                ),
                MathCalButton(
                  text: "+",
                  callback: numClick,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CalButton(
                  text: ".",
                  callback: numClick,
                ),
                CalButton(
                  text: "0",
                  callback: numClick,
                ),
                CalButton(
                  text: "00",
                  callback: numClick,
                ),
                MathCalButton(
                  text: "=",
                  callback: evaluate,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
