import 'package:http/http.dart' as http;

class NetworkHelper {
  Future<http.Response> getData({url}) async {
    return await http.get(url);
  }
}

class CovidData {
  CovidData(
      {this.updated,
      this.cases,
      this.deaths,
      this.recovered,
      this.active,
      this.name,
      this.todayCases,
      this.todayDeaths,
      this.todayRecovered});

  String name,
      updated,
      cases,
      todayCases,
      deaths,
      todayDeaths,
      recovered,
      todayRecovered,
      active;
  String getDate() {
    int timeInMillis = int.parse(updated);
    var date = DateTime.fromMillisecondsSinceEpoch(timeInMillis).toString();
    return date;
  }
}
