//Service providing access to the dog database, including the methods for data manipulation
import 'package:doggie_app/model/dog_model.dart';
import 'package:sqflite/sqflite.dart';

class DogDBService {
  final Future<Database> doggieDatabase;

  DogDBService(this.doggieDatabase);

  //method to insert data into the database
  Future<void> insertData(Dog dog) async {
    //get a reference to te database
    try {
      final db = await doggieDatabase;
      //conflict algorithm deals with what to do on inserting a data object that already exists
      db.insert(
        'dogs',
        dog.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    } catch (e) {
      print('Failure to insert values into the doggie_db: $e');
    }
  }

  //method to retrive the data values stored in the database
  Future<List<Dog>> retrieveData() async {
    try {
      final db = await doggieDatabase;
      //getting the results from the database
      final List<Map<String, Object?>> dogMaps = await db.query('dogs');
      return dogMaps.map((dogMap) => Dog.fromMap(dogMap)).toList();
    } catch (e) {
      print('Failed to retrive data from the database: $e');
      return <Dog>[];
    }
  }

  //method to update a set of data
  Future<void> updateData(Dog dog) async {
    try {
      final db = await doggieDatabase;
      db.update('dogs', dog.toMap(), where: 'id=?', whereArgs: [dog.id]);
    } catch (e) {
      print('Failed to update the dog data: $e');
    }
  }

  //method to delete a dog data
  Future<void> deleteData(Dog dog) async {
    final db = await doggieDatabase;
    db.delete('dogs', where: 'id=?', whereArgs: [dog.id]);
  }
}
