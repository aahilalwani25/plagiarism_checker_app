import 'package:flutter/foundation.dart';

class Privacy extends ChangeNotifier{

  bool _fingerprint_tile_clicked = false;
  final bool _face_id_tile_clicked = false;
  bool _enabled_fingerprint= false;

  void changeFingerprintTileClicked(bool clicked){
    _fingerprint_tile_clicked= clicked;
    notifyListeners();
  }

  void enabledFingerprintSwitch(bool value){
    _enabled_fingerprint= value;
    notifyListeners();
  }

  bool getEnabledFingerprintSwitch()=> _enabled_fingerprint;

  bool getFingerprintTileClicked()=> _fingerprint_tile_clicked;
}