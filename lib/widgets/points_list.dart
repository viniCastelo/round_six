// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';

class PointsListWidget extends StatelessWidget {
  PointsListWidget({
    required this.list,
    super.key,
  });

  List<String> list;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30.0),
      child: ListView.separated(
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(list[index]),
              trailing: Text('0 jogadas'),
              tileColor: Colors.grey[900],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
            );
          },
          separatorBuilder: (context, index) => Divider(
                color: Colors.transparent,
              ),
          itemCount: list.length),
    );
  }
}
