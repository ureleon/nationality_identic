import 'package:flutter/material.dart';

Widget cardsExample({final String? titleText, final String? subTitleText}) {
  return Card(
    shadowColor: Colors.white70,
    surfaceTintColor: Colors.white,
    elevation: 10,
    clipBehavior: Clip.antiAliasWithSaveLayer,
    child: ListTile(title: Text('$titleText'), subtitle: Text('$subTitleText')),
  );
}

// TODO(uleon): Improve cards and use inherited widgets for best UX
