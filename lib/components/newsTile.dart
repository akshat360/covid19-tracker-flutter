import 'package:flutter/material.dart';
import '../constants.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsTile extends StatefulWidget {
  final String title, description, image, source, date, url;
  NewsTile(
      {this.title,
      this.description,
      this.image,
      this.source,
      this.date,
      this.url});

  @override
  _NewsTileState createState() => _NewsTileState();
}

class _NewsTileState extends State<NewsTile> {
  //opening url in browser
  Future<void> _launchInBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: false,
        forceWebView: false,
        headers: <String, String>{'my_header_key': 'my_header_value'},
      );
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => setState(() {
        _launchInBrowser(widget.url ?? "https://www.google.com/");
      }),
      child: Card(
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
                    widget.image ??
                        "https://ichef.bbci.co.uk/news/1024/branded_news/15A8F/production/_112891788_mediaitem112891787.jpg",
                    width: 160,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        children: [
                          Text(
                            widget.title ?? "title",
                            style: TextStyle(fontWeight: FontWeight.w800),
                          ),
                          Text(widget.description ?? "Description")
                        ],
                      ),
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Text(widget.source ?? ""),
                  Text(widget.date.length != 0
                      ? "  |  ${widget.date.substring(0, 10)}"
                      : ""),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
