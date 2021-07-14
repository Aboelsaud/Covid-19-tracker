import 'package:flutter/material.dart';
import '../services/covidservice.dart';
import 'covid_view_model.dart';

class CovidListViewModel extends ChangeNotifier {

 CovidViewModel covids; 

  Future<void> fetchMovies(String keyword) async {
    final results =  await covidservice().fetchMovies(keyword);
    print("Asdsad");
    this.covids = CovidViewModel(covid: results);
    print(this.covids);
    notifyListeners(); 
  }

}