import 'package:flutter/foundation.dart';

class Privacy extends ChangeNotifier{

  final bool _fingerprint_tile_clicked = false;
  bool _face_id_tile_clicked = false;
  bool _enabled_fingerprint= false;

  void change_fingerprint_tile_clicked(bool clicked){
    _face_id_tile_clicked= clicked;
    notifyListeners();
  }

  void enabled_fingerprint_switch(bool value){
    _enabled_fingerprint= value;
    notifyListeners();
  }

  bool get_enabled_fingerprint_switch()=> _enabled_fingerprint;

  bool get_fingerprint_tile_clicked()=> _face_id_tile_clicked;
}