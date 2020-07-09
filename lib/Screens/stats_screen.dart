import 'package:flutter/material.dart';

class StatsScreen extends StatefulWidget {
  StatsScreen({Key key}) : super(key: key);
  @override
  _StatsScreenState createState() => _StatsScreenState();
}

class _StatsScreenState extends State<StatsScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(15, 30, 0, 20),
          child: Text(
            "Statitics",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.w800),
          ),
        ),
        Center(
          child: Text("Page Under Construction"),
        )
      ],
    );
  }
}
