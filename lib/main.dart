import 'package:flutter/material.dart';
import './view models/covid_list_view_model.dart';
import 'package:provider/provider.dart';
import './pages/covid_list_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Covid",
      home: 
      ChangeNotifierProvider(
        create: (context) => CovidListViewModel(), 
        child: Covid_list_page(),
      )
    );
  }

}