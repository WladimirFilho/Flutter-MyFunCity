import 'package:flutter/material.dart';

import '/constants/colors_constants.dart';

class TextFieldWidget extends StatelessWidget {
  TextFieldWidget({
    super.key,
    required this.textHint,
    required this.controler,
    this.isHidden = false,
  });

  final String textHint;
  final TextEditingController controler;
  final bool isHidden;

  @override
  Widget build(BuildContext context) {
    // container wrapping textfield
    return Container(
      height: 50,
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: ligthGrayColor,
        border: Border.all(
          width: 3,
          color: Colors.white,
        ),
      ),
      child: TextField(
        obscureText: isHidden,
        controller: controler,
        style: const TextStyle(color: smallTextColor, fontSize: 15),
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          hintText: textHint,
          hintStyle:
              const TextStyle(color: smallTextColor, fontSize: 12, height: 2),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
