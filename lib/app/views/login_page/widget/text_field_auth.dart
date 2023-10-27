import 'package:currency_converter/helpers/themes.dart';
import 'package:flutter/material.dart';

class myTextField extends StatelessWidget {
  final String hint;

  final TextEditingController controller;
  final TextInputType keyboardInput;

  myTextField({
    super.key,
    required this.hint,
    required this.controller,
    required this.keyboardInput,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: controller,
        style: textFieldInput,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: hintTextStyle,
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: borderColor, width: 2.0),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xFFBA68C8),
              width: 2.0,
            ),
          ),
        ),
        validator: (value) {
                if(value!.isEmpty || !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}').hasMatch(value!)){
                  return 'Enter Correct Email';
                }
                return null;
              },
        );
  }
}



class InputTextFormPassword extends StatefulWidget {
  final String hint;
  const InputTextFormPassword({
    super.key,
    required this.hint,
  });

  @override
  State<InputTextFormPassword> createState() => _InputTextFormPasswordState();
}

class _InputTextFormPasswordState extends State<InputTextFormPassword> {
  bool obsecureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        obscureText: obsecureText,
        style: textFieldInput,
        decoration: InputDecoration(
          hintText: widget.hint,
          hintStyle: hintTextStyle,
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: borderColor, width: 2.0),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xFFBA68C8),
              width: 2.0,
            ),
          ),
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                obsecureText = !obsecureText;
              });
            },
            icon: Icon(
              !obsecureText
                  ? Icons.visibility_rounded
                  : Icons.visibility_off_rounded,
              color: hintTextColor,
              size: 19,
            ),
          ),
        
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return 'Password is required';
          }

          return null;
        },
        
        
        );
  }
}


