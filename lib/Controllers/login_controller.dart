import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import '../Database/database.dart';
import '../Views/Teachers/teacher_dashboard.dart';
import '../Views/admin_dashboard.dart';
import '../Views/Students/student_main_dashboard.dart';
import '../global/components/toast_message.dart';

class LoginController {
  Database? db;
  String email, password, user;
  BuildContext context;

  LoginController(
      {required this.context,
      required this.email,
      required this.password,
      required this.user}) {
    db = Database();
  }

  Future<void> getLogin() async {
    if (user == "students") {
      getLoginAsStudent();
    } else if (user == "teachers") {
      getLoginAsTeacher();
    } else {
      final tableDatas = await db!.getData("super_admin");
      Verify(tableDatas);
    }
  }

  Future<void> getLoginAsTeacher() async {
    final tableDatas = await db!.getData("teachers");
    Verify(tableDatas);
  }

  Future<void> getLoginAsStudent() async {
    final tableDatas = await db!.getData("students");
    Verify(tableDatas);
  }

  void Verify(Stream<DatabaseEvent> tableDatas) =>
      tableDatas.forEach((DatabaseEvent event) {
        bool check = false;
        String? username;
        for (DataSnapshot child in event.snapshot.children) {
          //for finding unique id
          //print(child.key);

          //get sub-children of unique id
          Map<dynamic, dynamic> data = child.value as Map<dynamic, dynamic>;

          if (data['email'] == email && data['password'] == password) {
            check = true;
            username= data['username'];
            break;
          }
        }

        if (check) {
          if (user == 'students') {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (builder) => StudentMainDashboard(email: email, username: username!,)));
          }

          if (user == "teachers") {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (builder) => TeacherDashboard(email: email)));
          }

          if(user=="super_admin"){
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (builder) => AdminDashboard(email: email)));
          }
        } else {
          ToastMessage(
                  context: context,
                  message: "Incorrect Email or Password",
                  type: "error")
              .show();
        }
      });
}
