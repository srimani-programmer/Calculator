import 'package:flutter/material.dart';
import 'package:calculator/buttons.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(Calculator());
}

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  var userQuestion = '';
  var userAnswer = '';

  List<String> buttons = [
    'C',
    'Del',
    '%',
    '/',
    '9',
    '8',
    '7',
    'X',
    '6',
    '5',
    '4',
    '-',
    '1',
    '2',
    '3',
    '+',
    '.',
    '0',
    '=',
    'Ans'
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.black,
          body: Column(
            children: <Widget>[
              Expanded(
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                        alignment: Alignment.centerRight,
                        padding: EdgeInsets.all(15.0),
                        child: Text(
                          userQuestion,
                          style: TextStyle(color: Colors.white, fontSize: 29.0),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(15.0),
                        alignment: Alignment.centerRight,
                        child: Text(
                          userAnswer,
                          style: TextStyle(color: Colors.white, fontSize: 29.0),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: EdgeInsets.only(bottom: 20.0),
                  child: Container(
                    child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4),
                        itemCount: buttons.length,
                        itemBuilder: (BuildContext context, int index) {
                          if (index == 0) {
                            return MyButton(
                                buttonText: buttons[index],
                                textColor: isSpecialCharacter(buttons[index])
                                    ? Colors.white
                                    : Colors.black,
                                color: isSpecialCharacter(buttons[index])
                                    ? Colors.deepOrange
                                    : Colors.white,
                                fontsize: 22.0,
                                buttonTapped: () {
                                  setState(() {
                                    userQuestion = '';
                                    userAnswer = '';
                                  });
                                });
                          }else if(index == 1){
                            return MyButton(
                                buttonText: buttons[index],
                                textColor: isSpecialCharacter(buttons[index])
                                    ? Colors.white
                                    : Colors.black,
                                color: isSpecialCharacter(buttons[index])
                                    ? Colors.deepOrange
                                    : Colors.white,
                                fontsize: 22.0,
                                buttonTapped: () {
                                  setState(() {
                                    userQuestion = userQuestion.substring(0, (userQuestion.length-1));
                                  }
                                  );
                                }
                            );
                          }else if(index == buttons.length-2 || index == buttons.length-1){
                            return MyButton(
                                buttonText: buttons[index],
                                textColor: isSpecialCharacter(buttons[index])
                                    ? Colors.white
                                    : Colors.black,
                                color: isSpecialCharacter(buttons[index])
                                    ? Colors.deepOrange
                                    : Colors.white,
                                fontsize: 22.0,
                                buttonTapped: () {
                                  setState(() {
                                    equalPressed();
                                  }
                                  );
                                }
                            );
                          }else if(index == 7){
                            return MyButton(
                                buttonText: buttons[index],
                                textColor: isSpecialCharacter(buttons[index])
                                    ? Colors.white
                                    : Colors.black,
                                color: isSpecialCharacter(buttons[index])
                                    ? Colors.deepOrange
                                    : Colors.white,
                                fontsize: 22.0,
                                buttonTapped: () {
                                  setState(() {
                                    userQuestion += '*';
                                  }
                                  );
                                }
                            );
                          }
                          else{
                            return MyButton(
                                buttonText: buttons[index],
                                textColor: isSpecialCharacter(buttons[index])
                                    ? Colors.white
                                    : Colors.black,
                                color: isSpecialCharacter(buttons[index])
                                    ? Colors.deepOrange
                                    : Colors.white,
                                fontsize: 22.0,
                                buttonTapped: () {
                                  setState(() {
                                    userQuestion += buttons[index];
                                  }
                                  );
                                }
                            );
                          }
                        }),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  bool isSpecialCharacter(String x) {
    if (x == '+' ||
        x == '-' ||
        x == 'X' ||
        x == '/' ||
        x == '%' ||
        x == 'C' ||
        x == 'Del' ||
        x == 'Ans') {
      return true;
    }
    return false;
  }

  void equalPressed(){
    String question = userQuestion;
    Parser p = Parser();
    Expression expression = p.parse(question);
    ContextModel cm = ContextModel();
    double result = expression.evaluate(EvaluationType.REAL, cm);

    userAnswer = result.toString();
  }
}
