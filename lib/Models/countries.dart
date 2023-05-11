import 'package:flutter/foundation.dart';

class Countries with ChangeNotifier{

  String? _countryName="Pakistan";
  String? _countryCode="+92";

  String get countryName => _countryName!;
  String get countryCode => _countryCode!;
  void setCountryName(String countryName){
    _countryName=countryName;
    notifyListeners();
  }

  void setCountryCode(String code){
    _countryCode= code;
    notifyListeners();
  }
}