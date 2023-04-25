import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import '../Database/database.dart';
import '../global/components/toast_message.dart';

class SignupController {
  Database? db;
  BuildContext context;
  SignupController({required this.context}) {
    db = Database();
  }

  Future<bool> signup(String email, String phoneNumber, String username,
      String dob, String school, String password) async {
    return await db!.InsertData('student', {
      "username": username,
      "email": email,
      "phone_number": phoneNumber,
      "date_of_birth": dob,
      "school": school,
      "password": password,
    });
  }

  Future<void> check_existing_data(String username, String email) async {
    final tableDatas = await db!.getData("student");
    
    tableDatas.forEach((DatabaseEvent event) {
      for (DataSnapshot child in event.snapshot.children) {
        //for finding unique id
        //print(child.key);

        //get sub-children of unique id
        Map<dynamic, dynamic> data = child.value as Map<dynamic, dynamic>;

        if (data['email'] != email && data['username'] == username) {
          ToastMessage(
                  context: context,
                  message: "Username already exists",
                  type: "error")
              .show();
          break;
        } else if (data['email'] == email && data['username'] != username) {
          ToastMessage(
                  context: context,
                  message: "Email already exists",
                  type: "error")
              .show();
          break;
        } else {
          ToastMessage(
                  context: context,
                  message: "Email and Username already exists",
                  type: "error")
              .show();
          break;
        }
      }
    });
  }
}
