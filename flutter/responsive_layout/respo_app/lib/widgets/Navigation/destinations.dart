import 'package:flutter/material.dart';

class Destination {
  final IconData icon;
  final String label;

  Destination({required this.icon, required this.label});
}

final List<Destination> destinations = [
  Destination(icon: Icons.inbox_rounded, label: "Inbox"),
  Destination(icon: Icons.article_outlined, label: "Articles"),
  Destination(icon: Icons.messenger_outline_rounded, label: "Messages"),
  Destination(icon: Icons.group_outlined, label: "Groups"),
];
