import 'package:flutter/material.dart';

class CustomTextBox {


  InputDecoration large_size(String text, Color? fillColor, Icon? icon) {
    return InputDecoration(
      //border: InputBorder.none,
      icon: icon??icon,
      fillColor: fillColor,
      hintText: text,
      hintStyle: TextStyle()
    );
  }
}
