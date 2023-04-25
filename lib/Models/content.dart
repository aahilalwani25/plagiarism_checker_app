import 'package:flutter/foundation.dart';

class Content with ChangeNotifier {
  String? _content;
  int? _charactersCount;
  int? _wordsCount;
  bool _enabled= true;
  dynamic _plagiarised;

  Content();

  void setEnabled(bool enabled){
    _enabled= enabled;
    notifyListeners();
  }
  bool get enabled=> _enabled;
  

  void setPlagiarised(dynamic plag){
    _plagiarised=plag;
    notifyListeners();
  }
  dynamic get plagiarised=> _plagiarised;

  void setContent(String content) {
    _content = content;
    notifyListeners();
  }
  String? get content => _content;

  
  void setCharactersCount(int? charactersCount) {
    _charactersCount = charactersCount;
    notifyListeners();
  }
  int? get charactersCount => _charactersCount;

  int? get wordsCount => _wordsCount;
  void setWordsCount(int? wordsCount) {
    _wordsCount = wordsCount;
    notifyListeners();
  }

  Content.fromJson(Map<String, dynamic> json) {
    _content = json['content'];
    _charactersCount = json['characters_count'];
    _wordsCount = json['words_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['content'] = _content;
    data['characters_count'] = _charactersCount;
    data['words_count'] = _wordsCount;
    return data;
  }
}
