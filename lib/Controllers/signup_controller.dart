import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../Database/database.dart';
import '../global/components/toast_message.dart';

class SignupController {
  Database? db;
  BuildContext context;
  SignupController({required this.context}) {
    db = Database();
  }

  Future<bool> signup(String email, String phoneNumber, String username, String country, String password) async {
    int val = await check_existing_data(username, email);

    if (val == 1) {
      ToastMessage(
              context: context,
              message: "Username already exists",
              type: "error")
          .show();
      return false;
    }
    if (val == 2) {
      ToastMessage(
              context: context, message: "Email already exists", type: "error")
          .show();
      return false;
    }
    if (val == 3) {
      ToastMessage(
              context: context,
              message: "Email and Username already exists",
              type: "error")
          .show();
      return false;
    }
    return await db!.InsertData('student', {
      "username": username,
      "email": email,
      "phone_number": phoneNumber,
      "country": country,
      "password": password,
    });
  }

  Future<int> check_existing_data(String username, String email) async {
    final tableDatas = await db!.getData("students");
    int val = 0;
    tableDatas.forEach((DatabaseEvent event) {
      for (DataSnapshot child in event.snapshot.children) {
        //for finding unique id
        //print(child.key);

        //get sub-children of unique id
        Map<dynamic, dynamic> data = child.value as Map<dynamic, dynamic>;
        if (data['email'] != email && data['username'] == username) {
          val = 1;
          break;
        }
        if (data['email'] == email && data['username'] != username) {
          val = 2;
          break;
        }
        if (data['email'] == email && data['username'] == username) {
          val = 3;
          break;
        }
      }
    });

    return val;
  }


  void googleSignup(){
    //FirebaseAuth auth= FirebaseAuth.instance;
    
  }
}
