import 'package:elisoft_techincal_assignment/core/colors.dart';
import 'package:elisoft_techincal_assignment/core/font_sizes.dart';
import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  final void Function()? onTap;
  final String buttonText;

  const DefaultButton({
    super.key, 
    required this.onTap, 
    required this.buttonText
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Material(
        elevation: 7,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(8),
          bottomRight: Radius.circular(8)
        ),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 60,
          decoration: BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.circular(8),
            /*boxShadow: const [
              BoxShadow(
                color: shadowColor,
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 0.75)
              )
            ]*/
          ),
          child: Center(
            child: Text(
              buttonText,
              style: buttonLg(
                color: Colors.white
              ),
            ),
          ),
        ),
      ),
    );
  }
}