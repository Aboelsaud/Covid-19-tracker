import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/covid.dart';

class covidservice {

  Future<Covid> fetchMovies(String keyword) async {
    var response;
    if(keyword=="All"){
      response = await http.get(
          Uri.encodeFull("https://corona.lmao.ninja/v2/All"),
          headers: {"Accept": "application/json"});
    }
    else{
      response = await http.get(
          Uri.encodeFull("https://corona.lmao.ninja/v2/countries/$keyword"),
          headers: {"Accept": "application/json"});
    }
    

    if(response.statusCode == 200) {
       final body = jsonDecode(response.body);
       print(body); 
       return Covid.fromJson(body);

    } else {
      throw Exception("Unable to perform request!");  
    }
  }
}