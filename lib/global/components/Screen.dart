import 'package:flutter/material.dart';

class Screen{
    BuildContext context;

    Screen({required this.context});

    double? get height => MediaQuery.of(context).size.height;
    double? get width => MediaQuery.of(context).size.width;
}