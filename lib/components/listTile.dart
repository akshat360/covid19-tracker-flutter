import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import '../constants.dart';

class ListDetailTile extends StatelessWidget {
  ListDetailTile(
      {this.confirmed,
      this.state,
      this.active,
      this.deaths,
      this.recovered,
      this.isTitle = false});
  final String state, confirmed, active, recovered, deaths;
  final bool isTitle;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 15),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 3,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3),
                color: kLightGrayColor,
              ),
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              margin: EdgeInsets.symmetric(horizontal: 3),
              child: AutoSizeText(
                state,
                style: TextStyle(
                    fontWeight: isTitle ? FontWeight.w800 : FontWeight.w700),
                maxLines: 1,
                maxFontSize: 16,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3),
                color: kLightGrayColor,
              ),
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
              margin: EdgeInsets.symmetric(horizontal: 3),
              child: AutoSizeText(
                confirmed,
                style: TextStyle(
                    color: isTitle ? kRedColor : Colors.black,
                    fontWeight: isTitle ? FontWeight.w900 : FontWeight.w600),
                maxLines: 1,
                minFontSize: 10,
                maxFontSize: 11,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3),
                color: kLightGrayColor,
              ),
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
              margin: EdgeInsets.symmetric(horizontal: 3),
              child: AutoSizeText(
                active,
                style: TextStyle(
                    color: isTitle ? kBlueColor : Colors.black,
                    fontWeight: isTitle ? FontWeight.w900 : FontWeight.w600),
                maxLines: 1,
                minFontSize: 10,
                maxFontSize: 11,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3),
                color: kLightGrayColor,
              ),
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
              margin: EdgeInsets.symmetric(horizontal: 3),
              child: AutoSizeText(
                recovered,
                style: TextStyle(
                    color: isTitle ? kGreenColor : Colors.black,
                    fontWeight: isTitle ? FontWeight.w900 : FontWeight.w600),
                maxLines: 1,
                minFontSize: 10,
                maxFontSize: 11,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3),
                color: kLightGrayColor,
              ),
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
              margin: EdgeInsets.symmetric(horizontal: 3),
              child: AutoSizeText(
                deaths,
                style: TextStyle(
                    color: isTitle ? kDeathColor : Colors.black,
                    fontWeight: isTitle ? FontWeight.w900 : FontWeight.w600),
                maxLines: 1,
                minFontSize: 10,
                maxFontSize: 11,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
