import 'package:elisoft_techincal_assignment/core/colors.dart';
import 'package:elisoft_techincal_assignment/core/font_sizes.dart';
import 'package:elisoft_techincal_assignment/modules/views/widgets/default_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ConfirmationDialog extends StatelessWidget {
  final String title;
  final String content;
  final void Function() onConfirmation;
  
  const ConfirmationDialog({
    super.key, 
    required this.title, 
    required this.content, 
    required this.onConfirmation
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actionsPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15)
      ),
      backgroundColor: Colors.white,
      title: Text(
        title,
        style: h5(),
        textAlign: TextAlign.center,
      ),
      content: Text(
        content,
        style: bodyMd(color: contextGrey),
        textAlign: TextAlign.center,
      ),
      actions: [
        Row(
          children: [
            Expanded(
              child: DefaultButton(
                onTap: onConfirmation, 
                buttonColor: primaryColor, 
                buttonText: 'Yes'
              )
            ),
            const SizedBox(width: 10),
            Expanded(
              child: DefaultButton(
                onTap: () {
                  Get.back();
                }, 
                buttonColor: contextRed, 
                buttonText: 'No'
              )
            )
          ],
        )
      ],
    );
  }
}