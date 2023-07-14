// ignore_for_file: public_member_api_docs, sort_constructors_first, prefer_const_literals_to_create_immutables
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:round_six/models/enums/constants.dart';
import 'package:round_six/widgets/mode_title_widget.dart';
import 'package:round_six/widgets/points_list.dart';

class RecordsPageView extends StatefulWidget {
  const RecordsPageView({
    Key? key,
    required this.modo,
  }) : super(key: key);

  final Modo modo;

  @override
  State<RecordsPageView> createState() => _RecordsPageViewState();
}

class _RecordsPageViewState extends State<RecordsPageView> {
  final List<String> recs = ['Nível 8', 'Nível 10', 'Nível 12'];

  getModo() {
    return widget.modo == Modo.normal ? 'Normal' : 'Round 6';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pontuações'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ModeTitleWidget(text: getModo()),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            height: MediaQuery.of(context).size.height * 0.8,
            child: PointsListWidget(list: recs),
          ),
        ],
      ),
    );
  }
}
