import 'package:flutter/foundation.dart';

class LoginModel with ChangeNotifier{

  String? _email,_password;
  bool _remember_me=false;
  bool _password_visible = false;

  bool get password_visible => _password_visible;
  void setPasswordVisible(bool passwordVisible) {
    _password_visible = passwordVisible;
    notifyListeners();
  }
  

  void setEmail(String email){
    _email=email;
    notifyListeners();
  }

  void setPassword(String password){
    _password=password;
    notifyListeners();
  }

  void changeRememberMe(bool rememberMe){
    _remember_me=rememberMe;
    notifyListeners();
  }

  
  String get email=>_email!;
  String get password=> _password!;
  bool get remember_me =>_remember_me;
  
}