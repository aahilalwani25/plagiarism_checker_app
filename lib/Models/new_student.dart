import 'package:flutter/foundation.dart';

import 'countries.dart';

class NewStudent with ChangeNotifier {
  bool _password_visible=true, _c_password_visible=true;
  String? _email;
  String? _password;
  String? _phone;
  String? _gender;
  String? _username;
  String? _country;
  String? _country_code;


  NewStudent();

  bool get password_visible => _password_visible;
  void setPasswordVisible(bool password_visible) {
    _password_visible= password_visible;
    notifyListeners();
  }

  bool get c_password_invisible => _c_password_visible;
  void setConfirmPasswordVisible(bool confirm_password_visible) {
    _c_password_visible = confirm_password_visible;
    notifyListeners();
  }

  String? get email => _email;
  void setEmail(String? email) {
    _email = email;
    notifyListeners();
  }

  String? get password => _password;
  void setPassword(String? password) {
    _password = password;
    notifyListeners();
  }

  String? get phone => _phone;
  void setPhone(String? phone) {
    _phone = phone;
    notifyListeners();
  }

  String? get gender => _gender;
  void setGender(String? gender) {
    _gender = gender;
    notifyListeners();
  }

  String? get username => _username;
  void setUsername(String? username) {
    _username = username;
    notifyListeners();
  }

  String? get country => _country;
  void setCountry(Countries? country) {
    _country = country!.countryName;
    notifyListeners();
  }

  String? get country_code => _country_code;
  void setCountryCode(Countries? country) {
    _country_code = country!.countryCode;
    notifyListeners();
  }
}
