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

  Future<List<Map<String, String>>> getCountries() async{
    Stream<DatabaseEvent> stream= await db!.getData('countries');
    Map<String, String> countries = <String, String>{};
    List<Map<String, String>> countriesList=[];
    stream.forEach((element) { 
      for(var country in element.snapshot.children){
        countries.addEntries(countries.entries);
        countriesList.add(countries);
      }
    });

    return countriesList;
  }
}