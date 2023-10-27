import 'package:flutter/material.dart';

import '../../../../helpers/themes.dart';

class Mybutton extends StatelessWidget {
  final color;
  final textColor;
  final String buttonText;
  final buttonTapped;
  final TextStyle style;

  

  Mybutton({this.color, this.textColor, required this.buttonText, this.buttonTapped, required this.style});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: buttonTapped,
      child: ClipOval(
        clipBehavior: Clip.antiAlias,
        child: Container(
          
          padding: const EdgeInsets.all(8),
          margin: const EdgeInsets.all(0),
          child: Container(
            decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 5.0,
                        offset: Offset(0.0, 2.0),
                      ),
                    ],
                  ),
            child: Center(
              child: Text(
                buttonText,
                style: style,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
