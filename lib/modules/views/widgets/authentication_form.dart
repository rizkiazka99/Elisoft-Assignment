import 'package:elisoft_techincal_assignment/core/colors.dart';
import 'package:elisoft_techincal_assignment/core/font_sizes.dart';
import 'package:flutter/material.dart';

class AuthenticationForm extends StatefulWidget {
  final Key? formKey;
  final AutovalidateMode? autovalidateMode;
  final TextEditingController? controller;
  final bool obscureText;
  final TextInputType input;
  final int minLines;
  final int maxLines;
  final String label;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;

  const AuthenticationForm({
    super.key, 
    required this.formKey, 
    required this.autovalidateMode, 
    required this.controller, 
    this.obscureText = false, 
    this.input = TextInputType.text, 
    this.minLines = 1, 
    this.maxLines = 1, 
    required this.label, 
    this.suffixIcon, 
    required this.validator
  });

  @override
  State<AuthenticationForm> createState() => _AuthenticationFormState();
}

class _AuthenticationFormState extends State<AuthenticationForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      autovalidateMode: widget.autovalidateMode,
      child: TextFormField(
        controller: widget.controller,
        obscureText: widget.obscureText,
        keyboardType: widget.input,
        minLines: widget.minLines,
        maxLines: widget.maxLines,
        decoration: InputDecoration(
          labelText: widget.label,
          suffixIcon: widget.suffixIcon,
          suffixIconColor: primaryColor,
          errorMaxLines: 2,
          labelStyle: h5(
            color: primaryColor,
            fontWeight: FontWeight.normal
          ),
          filled: true,
          fillColor: secondaryColor,
          contentPadding: const EdgeInsets.all(20),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(
              color: secondaryColor
            )
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(
              color: primaryColor,
              width: 2
            )
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(
              color: contextRed,
              width: 2
            )
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(
              color: contextRed,
              width: 2
            )
          )
        ),
        validator: widget.validator,
      )
    );
  }
}