import 'package:firebase_database/firebase_database.dart';

import '../Database/database.dart';

class SignupController {
  Database? db;

  SignupController() {
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

  Future<bool> check_existing_data(String username, String email) async {
    return false;
  }
}
