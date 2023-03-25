import 'package:flutter/material.dart';

import '/constants/colors_constants.dart';

class BtnFullOrange extends StatelessWidget {
  const BtnFullOrange({
    super.key,
    required this.textFullOrangeBtn,
    required this.onTap,
    this.isDisable = false,
  });

  //variables
  final String textFullOrangeBtn;
  final VoidCallback onTap;
  final bool isDisable;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isDisable ? null : onTap,
      child: Container(
        height: 58,
        width: double.infinity,
        decoration: BoxDecoration(
          color: isDisable ? Colors.grey[300] : orangeColor,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            width: 4,
            color: isDisable ? Colors.grey[300]! : Color.fromARGB(255, 249, 213, 187),
          ),
        ),
        child: Center(
          child: Text(
            textFullOrangeBtn,
            style: const TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
