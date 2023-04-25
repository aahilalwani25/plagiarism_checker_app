import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import '../Database/database.dart';
import '../Views/admin_dashboard.dart';
import '../global/components/toast_message.dart';

class LoginController{

  Database? db;
  
  LoginController(){
    db= Database();
  }

  Future<void> getLogin(BuildContext context, String email, String password) async {
    final tableDatas = await db!.getData("super_admin");
    tableDatas.forEach((DatabaseEvent event) {
      for (DataSnapshot child in event.snapshot.children) {
        //for finding unique id
        //print(child.key);

        //get sub-children of unique id
        Map<dynamic, dynamic> data = child.value as Map<dynamic, dynamic>;

        if (data['email'] == email && data['password'] == password) {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (builder) => AdminDashboard(
                        email: email,
                      )));
          break;
        }else{
          ToastMessage(context: context, message: "Incorrect Email or Password", type: "error").show();
        }
      }
    });


  }
}