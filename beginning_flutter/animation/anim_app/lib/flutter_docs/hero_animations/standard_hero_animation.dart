import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import 'constants.dart';

class StandardHeroAnimation extends StatelessWidget {
  const StandardHeroAnimation({super.key});

  @override
  Widget build(BuildContext context) {
    timeDilation = 3;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text('S T A N D A R D  H E R O'),
            centerTitle: true,
            pinned: true,
            elevation: 4,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                'assets/dash_profile.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.all(16),
            sliver: SliverList.builder(
              itemCount: Dash.values.length,
              itemBuilder: (context, index) {
                return Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(10),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (BuildContext context) {
                            return DetailsPage(index: index);
                          },
                        ),
                      );
                    },
                    child: Card(
                        child: Row(
                      children: [
                        SizedBox(
                          height: 100,
                          width: 100,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Hero(
                              tag: Dash.values[index].photoName,
                              child: Image.asset(
                                Dash.values[index].photoName,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 16),
                        Text(
                          Dash.values[index].title,
                          style: TextStyle(fontSize: 24),
                        )
                      ],
                    )),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key, required this.index});
  final int index;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Dash.values[index].title.toUpperCase()),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 400,
            width: 400,
            child: Hero(
              tag: Dash.values[index].photoName,
              child: Image.asset(
                Dash.values[index].photoName,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 16),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                Dash.values[index].details,
                style: TextStyle(fontSize: 24),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
