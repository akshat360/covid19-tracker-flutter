import 'package:covid19tracker/components/newsTile.dart';
import 'package:flutter/material.dart';

class TipsScreen extends StatefulWidget {
  @override
  _TipsScreenState createState() => _TipsScreenState();
}

List<NewsTile> tipsContent = [NewsTile()];

class _TipsScreenState extends State<TipsScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(15, 30, 0, 20),
          child: Text(
            "Health Tips",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.w800),
          ),
        ),
        NewsTile(
          title: "Symptoms",
          description:
              "The COVID-19 virus affects different people in different ways",
          image:
              "https://images.vexels.com/media/users/3/193284/isolated/preview/2631e81702081ccd8cba4ee29499a466-covid-19-symptom-runny-nose-by-vexels.png",
          date: "",
        ),
        NewsTile(
          title: "Preventive Measures",
          description:
              "Check how to prevent infection and to slow transmission of COVID-19.",
          image:
              "https://images.vexels.com/media/users/3/193245/isolated/preview/22252b5a066d12c77a7b05ca36464bf9-covid-19-face-mask-girl-by-vexels.png",
          date: "",
        )
      ],
    );
  }
}
