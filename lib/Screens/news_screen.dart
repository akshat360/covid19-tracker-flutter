import 'dart:convert';
import 'package:covid19tracker/Services/network.dart';
import 'package:flutter/material.dart';
import 'package:covid19tracker/components/newsTile.dart';

List<NewsTile> newsContent = [];

class NewsScreen extends StatefulWidget {
  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  @override
  void initState() {
    super.initState();
    getNews();
  }

  Future getNews() async {
    NetworkHelper networkHelper = NetworkHelper();
    final now = DateTime.now();

    String date = now.toString().substring(0, 10);

    if (now.hour < 12) {
      final yesterday = new DateTime(
        now.year,
        now.month,
        now.day - 1,
      );
      date = yesterday.toString().substring(0, 10);
    }

    var jsonString = await networkHelper.getData(
        url:
            "http://newsapi.org/v2/everything?sources=bbc-news&q=covid&from=$date&sortBy=popularity&apiKey=635f67d0f1d04388b516fe1256bc4ec5");

    var json = jsonDecode(jsonString.body);
    for (var article in json["articles"]) {
      newsContent.add(NewsTile(
        title: article["title"],
        description: article["description"],
        image: article["urlToImage"],
        source: article["source"]["name"],
        date: article["publishedAt"],
        url: article["url"],
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(15, 30, 0, 20),
          child: Text(
            "Latest News",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.w800),
          ),
        ),
        Flexible(
          child: FutureBuilder<dynamic>(
              future: getNews(),
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return ListView.builder(
                      itemCount: newsContent.length,
                      itemBuilder: (context, index) {
                        return newsContent[index];
                      });
                } else if (snapshot.connectionState ==
                    ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
                return CircularProgressIndicator();
              }),
        )
      ],
    );
  }
}
