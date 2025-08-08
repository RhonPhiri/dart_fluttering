import 'package:doggie_app/providers/doggie_provider.dart';
import 'package:doggie_app/screens/details_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sqflite/sqflite.dart';
import '../model/dog_model.dart';

class HomePage extends StatefulWidget {
  final Dog? dog;

  const HomePage({super.key, this.dog});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _idController;
  late TextEditingController _nameController;
  late TextEditingController _ageController;

  @override
  void initState() {
    super.initState();
    _idController = TextEditingController();
    _nameController = TextEditingController();
    _ageController = TextEditingController();
    if (widget.dog != null) {
      _idController.text = widget.dog?.id.toString() ?? '';
      _nameController.text = widget.dog?.name ?? '';
      _ageController.text = widget.dog?.age.toString() ?? '';
    }
  }

  @override
  void dispose() {
    _idController.dispose();
    _nameController.dispose();
    _ageController.dispose();
    super.dispose();
  }

  void clearTextFields() {
    _idController.text = '';
    _nameController.text = '';
    _ageController.text = '';
  }

  //method to update the values of the dog
  void _updateDogData() {
    final updatedDog = Dog(
      id: int.parse(_idController.text),
      name: _nameController.text,
      age: int.parse(_ageController.text),
    );
    Navigator.of(context).pop(updatedDog);
  }

  @override
  Widget build(BuildContext context) {
    //variable to check if the Dog property is null or not
    final dogNotNull = widget.dog != null;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          dogNotNull ? 'Update' : 'Doogie',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
        ),
        elevation: 4,
        actions: [
          //button to indicate the number of dogs from the database
          //push to the details screen ontap
          dogNotNull
              ? SizedBox.shrink()
              : MaterialButton(
                color: Theme.of(context).colorScheme.inversePrimary,
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => DetailsPage()),
                  );
                },
                shape: CircleBorder(),
                child: Consumer<DoggieProvider>(
                  builder:
                      (context, value, child) =>
                          Text('${value.dogList.length}'),
                ),
              ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "${dogNotNull ? 'Edit' : 'Enter'} dog data",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Form(
                key: _formKey,

                child: Column(
                  children: List.generate(3, (index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: TextFormField(
                        controller:
                            index == 0
                                ? _idController
                                : index == 1
                                ? _nameController
                                : _ageController,
                        decoration: InputDecoration(
                          labelText:
                              index == 0
                                  ? 'Id'
                                  : index == 1
                                  ? 'Name'
                                  : 'Age',

                          border: OutlineInputBorder(),
                        ),
                        keyboardType:
                            index == 1
                                ? TextInputType.text
                                : TextInputType.numberWithOptions(),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return index == 0
                                ? 'Please enter the Dog\'s Id'
                                : index == 1
                                ? 'Please enter the Dog\'s name'
                                : 'Please enter the Dog\'s age';
                          }
                          return null;
                        },
                      ),
                    );
                  }),
                ),
              ),
              //button to submit the dog data
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    if (widget.dog != null) {
                      _updateDogData();
                    } else {
                      context.read<DoggieProvider>().insertData(
                        Dog(
                          id: int.parse(_idController.text),
                          name: _nameController.text,
                          age: int.parse(_ageController.text),
                        ),
                      );
                    }
                    clearTextFields();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Dog data ${dogNotNull ? 'Updated' : 'created'}',
                        ),
                      ),
                    );
                  }
                },
                child: Text(dogNotNull ? 'Update' : 'Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
