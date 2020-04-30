import 'package:flutter/material.dart';


class MyButton extends StatelessWidget {
  var color;
  var textColor;
  var fontsize;
  String buttonText;
  var buttonTapped;

  MyButton({this.color, this.textColor, this.buttonText, this.fontsize, this.buttonTapped});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: buttonTapped,
      child: Padding(
        padding: EdgeInsets.all(15.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(40),
          child: Container(
            color: color,
            child: Center(
              child: Text(
                buttonText,
                style: TextStyle(
                  color: textColor,
                  fontSize: fontsize
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
