import 'package:flutter/material.dart';

class Screen{
    BuildContext context;

    Screen({required this.context});

    double? get height => MediaQuery.of(context).size.height;
    double? get width => MediaQuery.of(context).size.width;
}

// class Styles extends Screen {


//   Styles({required super.context});
  
//   double? get headerFontSize => height! * 0.04;
//   double? get buttonFontSize => height! * 0.03;
// }
