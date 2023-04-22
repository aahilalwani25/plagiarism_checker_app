import 'package:flutter/foundation.dart';

class NewTeacher with ChangeNotifier {
  String? _email;
  String? _post;
  String? _password;
  String? _phone;
  String? _gender;
  String? _username;
  String? _country;
  String? _state;
  String? _city;

  NewTeacher(
      {String? email,
      String? post,
      String? password,
      String? phone,
      String? gender,
      String? username,
      String? country,
      String? state,
      String? city}) {
    if (email != null) {
      this._email = email;
    }
    if (post != null) {
      this._post = post;
    }
    if (password != null) {
      this._password = password;
    }
    if (phone != null) {
      this._phone = phone;
    }
    if (gender != null) {
      this._gender = gender;
    }
    if (username != null) {
      this._username = username;
    }
    if (country != null) {
      this._country = country;
    }
    if (state != null) {
      this._state = state;
    }
    if (city != null) {
      this._city = city;
    }
  }

  String? get email => _email;
  set email(String? email) => _email = email;
  String? get post => _post;
  set post(String? post) => _post = post;
  String? get password => _password;
  set password(String? password) => _password = password;
  String? get phone => _phone;
  set phone(String? phone) => _phone = phone;
  String? get gender => _gender;
  set gender(String? gender) => _gender = gender;
  String? get username => _username;
  set username(String? username) => _username = username;
  String? get country => _country;
  set country(String? country) => _country = country;
  String? get state => _state;
  set state(String? state) => _state = state;
  String? get city => _city;
  set city(String? city) => _city = city;

  NewTeacher.fromJson(Map<String, dynamic> json) {
    _email = json['email'];
    _post = json['post'];
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
    data['post'] = this._post;
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
