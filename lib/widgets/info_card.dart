import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {
  const InfoCard({super.key, this.titleText, this.subTitleText});

  final String? titleText;
  final String? subTitleText;

  @override
  Widget build(final BuildContext context) {
    return Card(
      shadowColor: Colors.white70,
      surfaceTintColor: Colors.white,
      elevation: 10,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: ListTile(
        title: Text('$titleText'),
        subtitle: Text('$subTitleText'),
      ),
    );
  }
}
