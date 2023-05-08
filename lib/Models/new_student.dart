import 'package:flutter/foundation.dart';

class NewStudent with ChangeNotifier {
  String? _email;
  String? _password;
  String? _phone;
  String? _gender;
  String? _username;
  String? _country;
  String? _country_code;
  String? _state;
  String? _city;

  NewStudent();

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
  void setCountry(String? country) {
    _country = country;
    notifyListeners();
  }

  String? get state => _state;
  void setState(String? state) {
    _state = state;
    notifyListeners();
  }

  String? get city => _city;
  void setCity(String? city) {
    _city = city;
    notifyListeners();
  }

  String? get country_code => _country_code;
  void setCountryCode(String? code) {
    _country_code = code;
    notifyListeners();
  }


  NewStudent.fromJson(Map<String, dynamic> json) {
    _email = json['email'];
    _password = json['password'];
    _phone = json['phone'];
    _gender = json['gender'];
    _username = json['username'];
    _country = json['country'];
    _state = json['State'];
    _city = json['City'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this._email;
    data['password'] = this._password;
    data['phone'] = this._phone;
    data['gender'] = this._gender;
    data['username'] = this._username;
    data['country'] = this._country;
    data['State'] = this._state;
    data['City'] = this._city;
    return data;
  }
}
