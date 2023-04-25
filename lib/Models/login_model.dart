import 'package:flutter/foundation.dart';

class LoginModel with ChangeNotifier{

  String? _email,_password;
  bool _remember_me=false;
  

  void setEmail(String email){
    _email=email;
    notifyListeners();
  }

  void setPassword(String password){
    _password=password;
    notifyListeners();
  }

  void changeRememberMe(bool remember_me){
    _remember_me=remember_me;
    notifyListeners();
  }

  
  String get email=>_email!;
  String get password=> _password!;
  bool get remember_me =>_remember_me;
  
}