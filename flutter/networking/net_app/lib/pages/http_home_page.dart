import 'package:flutter/material.dart';
import '../classes.dart';
import '../networking/delete_data.dart';
import '../networking/fetching_data.dart';

//working with HTTP
class HttpHomePage extends StatefulWidget {
  const HttpHomePage({super.key});

  @override
  State<HttpHomePage> createState() => _HttpHomePageState();
}

class _HttpHomePageState extends State<HttpHomePage> {
  late Future<Album> _futureAlbum;

  @override
  void initState() {
    super.initState();
    _futureAlbum = fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 4,
        centerTitle: true,
        title: Text('N E T A P P  (Http)'),
      ),
      body: FutureBuilder(
        future: _futureAlbum,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return Center(
                child: CircularProgressIndicator(),
              );

            case ConnectionState.active:
            case ConnectionState.done:
              if (snapshot.hasError) {
                return Padding(
                  padding: EdgeInsets.all(16),
                  child: Center(child: Text('Error: ${snapshot.error}')),
                );
              }
          }
          return Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    snapshot.data.id == null
                        ? 'No data to display!'
                        : 'ID: ${snapshot.data.id}\nTitle: ${snapshot.data.title}',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ),
                SizedBox(height: 8),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _futureAlbum = deleteAlbum(snapshot.data.id);
                      });
                    },
                    child: Text('Delete Data'))
              ],
            ),
          );
        },
      ),
    );
  }
}
