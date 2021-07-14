class Covid {

  final int todayCases; 
  final int todayDeaths; 
  final int active;
  final int cases;
  final int deaths;
  final int recovered;
  
  Covid({this.todayCases, this.todayDeaths,this.active, this.cases,this.deaths,this.recovered});
  
  factory Covid.fromJson(Map<String,dynamic>data) {
    return Covid(
      todayCases: data["todayCases"], 
      todayDeaths: data["todayDeaths"],
      active: data["active"], 
      cases: data["cases"], 
      deaths: data["deaths"], 
      recovered: data["recovered"],  
    );
  }
}