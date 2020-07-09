import 'dart:convert';
import 'package:covid19tracker/components/listTile.dart';
import 'package:covid19tracker/constants.dart';
import "package:flutter/material.dart";
import 'package:covid19tracker/Services/network.dart';
import 'package:covid19tracker/Services/numberFormat.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/bg1.png"), fit: BoxFit.cover)),
      child: MainHome(),
    );
  }
}

List<ListDetailTile> listOfDetails = [
  ListDetailTile(
    state: "State/UT",
    confirmed: "C",
    recovered: "R",
    active: "A",
    deaths: "D",
    isTitle: true,
  ),
];

class MainHome extends StatefulWidget {
  @override
  _MainHomeState createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        CountrySelector(),
        BasicStats(),
        BasicDetails(),
      ],
    );
  }
}

class BasicStats extends StatefulWidget {
  @override
  _BasicStatsState createState() => _BasicStatsState();
}

class _BasicStatsState extends State<BasicStats> {
  CovidData covidData;

  @override
  void initState() {
    super.initState();
    getBasicDetails();
  }

  Future getBasicDetails() async {
    NetworkHelper networkHelper = NetworkHelper();
    var jsondata =
        await networkHelper.getData(url: "https://disease.sh/v2/all");
    var json = jsonDecode(jsondata.body);
    NumberFormat numberFormat = NumberFormat();
    covidData = CovidData(
      updated: json["updated"].toString(),
      name: json["updated"].toString(),
      cases: numberFormat.intWord(json["cases"]),
      todayCases: numberFormat.intWord(json["todayCases"]),
      deaths: numberFormat.intWord(json["deaths"]),
      todayDeaths: numberFormat.intWord(json["todayDeaths"]),
      recovered: numberFormat.intWord(json["recovered"]),
      todayRecovered: numberFormat.intWord(json["todayRecovered"]),
      active: numberFormat.intWord(json["active"]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<dynamic>(
      future: getBasicDetails(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(25, 0, 25, 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    "Last updated : ${covidData.getDate().substring(0, 10)}",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Colors.white70,
                        fontWeight: FontWeight.w600,
                        fontSize: 15),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  children: <Widget>[
                    BigCard(
                      title: "CONFIRMED",
                      totalNo: covidData.cases ?? 0,
                      todayNo: covidData.todayCases ?? 0,
                      mainColor: kRedColor,
                    ),
                    BigCard(
                      title: "ACTIVE",
                      totalNo: covidData.active ?? 0,
                      mainColor: kBlueColor,
                    )
                  ],
                ),
                Row(
                  children: <Widget>[
                    BigCard(
                      title: "RECOVERED",
                      totalNo: covidData.recovered ?? 0,
                      todayNo: covidData.todayRecovered ?? 0,
                      mainColor: kGreenColor,
                    ),
                    BigCard(
                      title: "DEATHS",
                      totalNo: covidData.deaths ?? 0,
                      todayNo: covidData.todayDeaths ?? 0,
                      mainColor: kDeathColor,
                    )
                  ],
                ),
              ],
            ),
          );
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        return CircularProgressIndicator();
      },
    );
  }
}

class BigCard extends StatelessWidget {
  BigCard({this.title, this.todayNo, this.totalNo, this.mainColor});
  final String title, totalNo, todayNo;
  final Color mainColor;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        elevation: 4,
        margin: EdgeInsets.all(10),
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                title ?? "CONFIRMED",
                style: TextStyle(
                    color: kDarkGrayColor,
                    fontSize: 15,
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: <Widget>[
                  Expanded(
                    flex: 5,
                    child: Text(
                      totalNo ?? "529K",
                      style: TextStyle(color: mainColor, fontSize: 22),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: todayNo != null
                        ? Icon(
                            Icons.arrow_upward,
                            color: mainColor,
                            size: 18,
                          )
                        : Text(""),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      todayNo ?? "",
                      style: TextStyle(color: mainColor, fontSize: 10),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 18,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BasicDetails extends StatefulWidget {
  @override
  _BasicDetailsState createState() => _BasicDetailsState();
}

class _BasicDetailsState extends State<BasicDetails> {
  @override
  void initState() {
    super.initState();
    getBasicTilesDetails();
  }

  Future getBasicTilesDetails() async {
    NetworkHelper networkHelper = NetworkHelper();
    var jsondata = await networkHelper.getData(
        url: "https://disease.sh/v3/covid-19/countries?sort=cases");
    var jsonBody = jsonDecode(jsondata.body);
    NumberFormat numberFormat = NumberFormat();
    for (var json in jsonBody) {
      listOfDetails.add(ListDetailTile(
        state: json["country"].toString() ?? "--",
        confirmed: numberFormat.intWord(json["cases"]) ?? "000K",
        recovered: numberFormat.intWord(json["recovered"]) ?? "000K",
        active: numberFormat.intWord(json["active"]) ?? "000K",
        deaths: numberFormat.intWord(json["deaths"]) ?? "000K",
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: FutureBuilder(
          future: getBasicTilesDetails(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return ListView.builder(
                  itemCount: listOfDetails.length,
                  itemBuilder: (context, index) {
                    return listOfDetails[index];
                  });
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            return CircularProgressIndicator();
          }),
    );
  }
}

class CountrySelector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(35, 40, 0, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Covid 19 Tracker",
            style: TextStyle(
              color: Colors.white70,
              fontSize: 15,
              fontWeight: FontWeight.w700,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Text(
              "Worldwide",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.w700),
            ),
          ),
        ],
      ),
    );
  }
}
