import 'package:doggie_app/providers/doggie_provider.dart';
import 'package:doggie_app/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final doggieProvider = context.watch<DoggieProvider>();
    return Scaffold(
      appBar: AppBar(title: Text('Details'), elevation: 4),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child:
            doggieProvider.dogList.isEmpty
                ? Center(child: Text('No data available'))
                : ListView.separated(
                  itemBuilder: (context, index) {
                    final dog = doggieProvider.dogList[index];
                    return ListTile(
                      title: Text('Id: ${dog.id}  Name: ${dog.name}'),
                      subtitle: Text('Age: ${dog.age} Years old'),
                      onTap: () async {
                        final updatedDog = await Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => HomePage(dog: dog),
                          ),
                        );
                        if (updatedDog != null) {
                          doggieProvider.updateData(updatedDog);
                        }
                      },
                      trailing: IconButton(
                        onPressed: () {
                          context.read<DoggieProvider>().deletedata(dog);
                        },
                        icon: Icon(Icons.delete),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => Divider(height: 0),
                  itemCount: doggieProvider.dogList.length,
                ),
      ),
    );
  }
}
