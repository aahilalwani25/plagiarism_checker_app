import '../Database/database.dart';

class LoginController{

  Login? login;
  LoginController(){
    login= Login();
  }

  Future<bool> getLogin(String email, String password) async {
    return await login!.login('super_admin', {"email":email,"password":password});
  }

  // Future<bool> getLogin(Map<String,dynamic> data) async {
  //   bool check=false;
  //   check= await db!.InsertData("admin", data);
  //   return check;
  // }
}