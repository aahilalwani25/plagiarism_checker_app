import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:plagiarism_checker_app/Database/database.dart';

class FileController {

  final Database _database= Database();

  Future<bool> storeFile(File file, String userId) async {
    Reference storageRef = FirebaseStorage.instance.ref();
    
    // Create a child reference
    // imagesRef now points to "images"
    Reference userRef = storageRef.child('plagiarism_history/${userId}');
    UploadTask storageUploadTask = userRef.child("plagiarism_1").putFile(file);
    
    TaskSnapshot taskSnapshot= await storageUploadTask.whenComplete(() =>{
      print("upload done")
    });

    String url= await taskSnapshot.ref.getDownloadURL();

    if(url.isNotEmpty){
    //   //store url in plagiarism history
      bool check= await _database.InsertData('plagiarism_history', {
        "user_id":userId,
        "pdf": url,
      });

      if(check){
        return true;
      }
    }
    return false;
  }
}

//enum FileType { pdf, img, doc }
