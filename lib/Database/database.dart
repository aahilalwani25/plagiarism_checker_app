import 'package:firebase_database/firebase_database.dart';

class Database {
  FirebaseDatabase? _db;

  Database() {
    _db = FirebaseDatabase.instance;
  }

  Future<bool> InsertData(String tableName, Map<String, dynamic> value) async {
    bool check = false;
    DatabaseReference databaseReference = _db!.ref('/$tableName');
    await databaseReference.push().set(value).then((value) {
      check = true;
    });
    return check;
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

class Login extends Database {
  DatabaseReference? _databaseReference;
  DataSnapshot? _snapshot;
  bool check = false;
  @override
  Future<bool> login(String tableName, Map<String, dynamic> value) async {
    _databaseReference ??= _db!.ref('/$tableName');

    //if snapshot is null, then initialize it
    _snapshot ??= await _databaseReference!.get();

    _databaseReference!.onValue.listen((event) {
      for (var child in event.snapshot.children) {
        //for finding unique id
        //print(child.key);
        Map<dynamic, dynamic> data = child.value as Map<dynamic, dynamic>;

        if (data['email'] == value['email'] &&
            data['password'] == value['password']) {
          check = true;
          break;
        }

        print(data);
      }
    });

    return check;
  }
}
