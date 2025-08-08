import 'package:flutter/material.dart';
import 'widget_path.dart';

//enum to hold the data of the widgets, title and the respective homepage constructor
enum WidgetOfTheWeek {
  flow('Flow', FlowHome()),
  table('Table', TableHome());

  final String title;
  final Widget homePage;
  const WidgetOfTheWeek(this.title, this.homePage);
}
