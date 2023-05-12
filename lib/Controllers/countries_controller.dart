import 'package:firebase_database/firebase_database.dart';

import '../Database/database.dart';
import '../Models/countries.dart';

class CountriesController{

  Countries? countries;
  Database? db;

  Future<bool> addCountry(Countries countries) async{
    return await db!.InsertData('countries', {
      "name": countries.countryName,
      "code": countries.countryCode,
    });
  }

  Future<List<Map<dynamic, dynamic>>> getCountries() async{
    Stream<DatabaseEvent> stream= await db!.getData('countries');
    List<Map<dynamic, dynamic>> countriesList=[];
    stream.forEach((element) { 
      for(var country in element.snapshot.children){
        //get sub-children of unique id
        Map<dynamic, dynamic> data = country.value as Map<dynamic, dynamic>;
        countriesList.add(data);
      }
    });

    return countriesList;
  }
}