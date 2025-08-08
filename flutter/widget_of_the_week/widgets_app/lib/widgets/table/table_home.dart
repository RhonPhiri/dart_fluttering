import 'package:flutter/material.dart';
import 'package:widgets_app/widgets/table/table_data.dart';

class TableHome extends StatelessWidget {
  const TableHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('T A B L E')),
      body: Table(
        border: TableBorder.all(color: Theme.of(context).colorScheme.onSurface),
        children: List.generate(tableData.keys.length, (int index) {
          final rowData = tableData[tableData.keys.elementAt(index)];
          return TableRow(
            children: List.generate(rowData?.length ?? 0, (int index) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(rowData![index]),
                ),
              );
            }),
          );
        }),
      ),
    );
  }
}
