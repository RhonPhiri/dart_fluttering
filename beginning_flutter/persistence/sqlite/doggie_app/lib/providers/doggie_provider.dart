import 'package:doggie_app/model/dog_model.dart';
import 'package:doggie_app/services/dog_db_service.dart';
import 'package:flutter/widgets.dart';
import 'package:sqflite/sqlite_api.dart';

class DoggieProvider with ChangeNotifier {
  //rpoperty to inherit the database
  final Future<Database> database;

  //variable to access the dogDatabase service. Requires a database hence can only access the
  //database above in the constructor body
  late final DogDBService _dogDBService;

  DoggieProvider({required this.database}) {
    _dogDBService = DogDBService(database);
    retrieveData();
  }

  //varible to hold the list of retrived dog data
  List<Dog> _dogList = [];
  List<Dog> get dogList => List.unmodifiable(_dogList);

  //method to retrieve the stored data
  Future<void> retrieveData() async {
    final dogs = await _dogDBService.retrieveData();
    _dogList.clear();
    _dogList.addAll(dogs);
    notifyListeners();
  }

  //method to store dog data
  Future<void> insertData(Dog dog) async {
    await _dogDBService.insertData(dog);
    retrieveData();
  }

  //method to update the stored Data
  Future<void> updateData(Dog dog) async {
    await _dogDBService.updateData(dog);
    retrieveData();
  }

  //method to delete data
  Future<void> deletedata(Dog dog) async {
    await _dogDBService.deleteData(dog);
    retrieveData();
  }
}
