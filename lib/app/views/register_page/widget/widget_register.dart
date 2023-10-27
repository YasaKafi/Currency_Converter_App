import 'package:currency_converter/app/views/register_page/controller/register_controller.dart';
import 'package:flutter/material.dart';

import '../../../../helpers/themes.dart';

// ignore: camel_case_types
class myTextFieldB extends StatelessWidget {
  final String hint;
  final TextInputType keyboardInput;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  const myTextFieldB({
    super.key,
    required this.hint,
    required this.keyboardInput,
    required this.controller,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        validator: validator,
        keyboardType: keyboardInput,
        controller: controller,
        style: textFieldInputB,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: hintTextStylB,
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: borderColor, width: 2.0),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xFFBA68C8),
              width: 2.0,
            ),
          ),
        ));
  }
}

class InputTextFormPasswordB extends StatefulWidget {
  final String hint;

  const InputTextFormPasswordB({
    super.key,
    required this.hint,
  });

  @override
  State<InputTextFormPasswordB> createState() => _InputTextFormPasswordBState();
}

class _InputTextFormPasswordBState extends State<InputTextFormPasswordB> {
  final RegisterController registerController = RegisterController();
  bool obsecureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: registerController.passwordController,
        obscureText: obsecureText,
        style: textFieldInputB,
        validator: (value) {
          if (value!.isEmpty) {
            return 'Password is required';
          }

          return null;
        },
        decoration: InputDecoration(
          hintText: widget.hint,
          hintStyle: hintTextStylB,
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
              color: primaryColor,
              size: 19,
            ),
          ),
        ));
  }
}

class InputTextFormPasswordC extends StatefulWidget {
  final String hint;
  final TextInputType keyboardInput;
  final TextEditingController controller;

  const InputTextFormPasswordC({
    super.key,
    required this.hint,
    required this.keyboardInput,
    required this.controller,
  });

  @override
  State<InputTextFormPasswordC> createState() => _InputTextFormPasswordCState();
}

class _InputTextFormPasswordCState extends State<InputTextFormPasswordC> {
  final RegisterController registerController = RegisterController();
  bool obsecureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        keyboardType: widget.keyboardInput,
        controller: widget.controller,
        style: textFieldInputB,
        validator: (value) {
          if (value!.isEmpty ||
              !RegExp(r'^[0-9]{1,4}[-\s\./0-9]+$').hasMatch(value!)) {
            return 'Enter Correct Phone Number';
          }
          return null;
        },
        decoration: InputDecoration(
          hintText: widget.hint,
          hintStyle: hintTextStylB,
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: borderColor, width: 2.0),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xFFBA68C8),
              width: 2.0,
            ),
          ),
        ));
  }
}
