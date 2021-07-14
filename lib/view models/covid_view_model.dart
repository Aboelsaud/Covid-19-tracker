import '../models/covid.dart';

class CovidViewModel {

  final Covid covid; 

  CovidViewModel({this.covid});

  int get todayCases {
    return this.covid.todayCases; 
  }

  int get todayDeaths {
    return this.covid.todayDeaths; 
  }

  int get active {
    return this.covid.active; 
  }

  int get cases {
    return this.covid.cases; 
  }

  int get deaths {
    return this.covid.deaths; 
  }

  int get recovered {
    return this.covid.recovered; 
  }

}