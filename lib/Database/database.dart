import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';
import 'package:plagiarism_checker_app/Models/login_model.dart';

class Database {
  FirebaseDatabase? _db;
  DatabaseReference? _databaseReference;

  Database() {
    _db = FirebaseDatabase.instance;
  }

  Future<bool> InsertData(String tableName, Map<String, dynamic> value) async {
    bool check = false;
    _databaseReference??= _db!.ref('/$tableName');
    await _databaseReference!.push().set(value).then((value) {
      check = true;
    });
    return check;
  }

  Future<Stream<DatabaseEvent>> getData(String tableName) async{
    _databaseReference ??= _db!.ref('/$tableName');

    //if snapshot is null, then initialize it
    DataSnapshot _snapshot = await _databaseReference!.get();
    return _databaseReference!.onValue;
  }

  // Future<List> GetData(String tableName, Map<String,dynamic> value) async{

  //   List datas=[];
  //   DatabaseReference databaseReference = _db!.ref('/$tableName');
  //   DataSnapshot snapshot= await databaseReference.get();

  //   if(snapshot.exists){
  //     final id= snapshot.key;
  //     Map<String,dynamic> jsonData={};

  //     //snapshot=snapshot.child(id.toString());

  //     if(snapshot.hasChild(id.toString())){
  //       final child_data= snapshot.child(id.toString());
  //       jsonData.addAll({"id":id, child_data.})
  //     }

  //   }

  //   return datas;
  // }
}