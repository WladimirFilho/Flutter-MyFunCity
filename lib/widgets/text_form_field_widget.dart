import 'package:flutter/material.dart';

import '../constants/colors_constants.dart';

class TextFormFieldWidget extends StatelessWidget {
  TextFormFieldWidget({
    Key? key,
    required this.validator,
    required this.controler,
    required this.hint,
    this.isHidden = false,
    this.trallingIcon,
  }) : super(key: key);

  final String? Function(String?) validator;
  final TextEditingController controler;
  final String hint;
  final bool isHidden;
  final Widget? trallingIcon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          obscureText: isHidden,
          cursorWidth: 3,
          cursorColor: Colors.white,
          validator: validator,
          controller: controler,
          decoration: InputDecoration(
            suffixIcon: trallingIcon,
            contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white, width: 3),
              borderRadius: BorderRadius.circular(15),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white, width: 3),
              borderRadius: BorderRadius.circular(15),
            ),
            fillColor: ligthGrayColor,
            filled: true,
            hintText: hint,
            hintStyle: TextStyle(
              color: smallTextColor,
              fontSize: 12,
              height: 2,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
