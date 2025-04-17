import 'dart:io';

import 'package:path_provider/path_provider.dart';

class CounterStorage {
  //locating the correct path using path_provider
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  //create a reference to the file's full location
  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/counter.txt');
  }

  //method to write to the file created as a string
  Future<File> writeCounterValue(int counter) async {
    final file = await _localFile;
    return file.writeAsString('$counter');
  }

  //read data written in the file that was created, return an int
  Future<int> readCounterValue() async {
    try {
      final file = await _localFile;
      final contents = await file.readAsString();
      return int.parse(contents);
    } catch (e) {
      return 0;
    }
  }
}
