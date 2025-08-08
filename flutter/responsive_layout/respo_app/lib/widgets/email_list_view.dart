import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:respo_app/data/repositories/email_repo.dart';
import 'package:respo_app/widgets/email_widget.dart';
import 'package:respo_app/widgets/search_bar.dart' as search_bar;

import '../data/models/models.dart';

class EmailListView extends StatelessWidget {
  const EmailListView({
    super.key,
    this.selectedIndex,
    this.onSelected,
    required this.currentUser,
  });

  final int? selectedIndex;
  final ValueChanged<int>? onSelected;
  final User currentUser;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ScrollConfiguration(
        behavior: ScrollBehavior().copyWith(
          scrollbars: false,
          dragDevices: {PointerDeviceKind.mouse, PointerDeviceKind.touch},
          physics: ClampingScrollPhysics(),
        ),
        child: ListView(
          children: [
            const SizedBox(height: 8),
            search_bar.SearchBar(currentUser: currentUser),
            const SizedBox(height: 8),
            ...List.generate(emails.length, (index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: EmailWidget(
                  email: emails[index],
                  onSelected: onSelected != null
                      ? () {
                          onSelected!(index);
                        }
                      : null,
                  isSelected: selectedIndex == index,
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
