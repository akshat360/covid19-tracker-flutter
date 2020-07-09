import 'package:flutter/material.dart';

import '../constants.dart';

class NewsTile extends StatelessWidget {
  final String title, description, image, source, date;
  NewsTile({this.title, this.description, this.image, this.source, this.date});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      color: kLightGrayColor,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: <Widget>[
                Image.network(
                  image ??
                      "https://ichef.bbci.co.uk/news/1024/branded_news/15A8F/production/_112891788_mediaitem112891787.jpg",
                  width: 160,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      children: [
                        Text(
                          title ?? "title",
                          style: TextStyle(fontWeight: FontWeight.w800),
                        ),
                        Text(description ?? "Description")
                      ],
                    ),
                  ),
                )
              ],
            ),
            Row(
              children: [
                Text(source ?? ""),
                Text(date.length != 0 ? "  |  ${date.substring(0, 10)}" : ""),
              ],
            )
          ],
        ),
      ),
    );
  }
}
