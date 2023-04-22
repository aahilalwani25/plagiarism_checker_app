import 'dart:convert';
import 'package:http/http.dart';

class PlagiarismController{
  String text;
  
  PlagiarismController({required this.text});

  dynamic start_check() async{
    MultipartRequest request= MultipartRequest('POST', Uri.parse('http://192.168.2.108:8000/check-plag/'));
    request.fields.addAll({'text_content':text});
    StreamedResponse streamedResponse= await request.send();
    request.headers.addAll({
      'Content-Type':'Application/json',
    });
    if(streamedResponse.statusCode==200){
      Response response= await Response.fromStream(streamedResponse);
      return json.decode(response.body);
    }

    return null;
  }
}