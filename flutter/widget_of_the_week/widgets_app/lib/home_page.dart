import 'package:flutter/material.dart';
import 'widgets/widget_of_the_week_enum.dart' show WidgetOfTheWeek;

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text('W I D G E T S  H O M E'),
            forceElevated: true,
          ),
          SliverList.separated(
            itemCount: WidgetOfTheWeek.values.length,
            itemBuilder: (context, index) {
              final widget = WidgetOfTheWeek.values[index];
              return InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => widget.homePage),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 16.0,
                  ),
                  child: Text(
                    '${index + 1}.  ${widget.title}',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) => Divider(),
          ),
        ],
      ),
    );
  }
}
