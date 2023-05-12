import 'package:flutter/material.dart';
import 'Screen.dart';

class ToastMessage{

  String message;
  String type;
  BuildContext context;
  Screen? screen;
  ToastMessage({required this.context,required this.message, required this.type}){
    screen = Screen(context: context);
  }

  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> show(){
    Color backgroundColor= Colors.red;
    if (type=="success"){
      backgroundColor= Colors.green;
    }
    
    if(type=="warning"){
      backgroundColor= Colors.yellow;
    }


    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Center(
          child: Text(message,
        style: const TextStyle(color: Colors.white),
      )),
      backgroundColor: backgroundColor,
      behavior: SnackBarBehavior.floating,
      width: 300 * 0.9,
    ));
  }
}