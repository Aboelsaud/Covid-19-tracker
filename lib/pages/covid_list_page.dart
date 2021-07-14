import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../global_card.dart';
import 'package:provider/provider.dart';
import '../view models/covid_list_view_model.dart';
import 'package:covid_19_tracker/theme/color/light_color.dart';

int check=0;

class Covid_list_page extends StatefulWidget {
  @override
  _Covid_list_pageState createState() => _Covid_list_pageState();
}

class _Covid_list_pageState extends State<Covid_list_page> {

  @override
  void initState(){
    super.initState();
    //Provider.of<CovidListViewModel>(context,listen: false).fetchMovies("All");
  }

  String s = "All";
  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<CovidListViewModel>(context);
    final mediaQuery = MediaQuery.of(context);
    final appBar = _customAppBar();
    return Scaffold(
        appBar: appBar,
        body: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                  colorFilter: ColorFilter.mode(Colors.white70, BlendMode.colorDodge),
                    image: AssetImage("assets/images/5.jpg"),
                    fit: BoxFit.cover)),
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  height: 60,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.black38,
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(
                      color: Color(0xFFE5E5E5),
                    ),
                  ),
                  child: Row(children: <Widget>[
                    Expanded(
                      child: DropdownButton(
                        isExpanded: true,
                        underline: SizedBox(),
                        icon: SvgPicture.asset("assets/icons/dropdown.svg"),
                        value: s,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 19,
                            fontWeight: FontWeight.bold),
                        items: [
                          'All','Egypt','USA','Spain','Italy','France','Germany',
                          'Iran','China','Brazil','Russia','India','Peru','Turkey'
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (value) {
                          s=value;
                          check=1;
                          vm.fetchMovies(value);
                        },
                      ),
                    ),
                  ]),
                ),
                Global_card(
                    cardTitle: 'TOTAL CASES',
                    caseTitle: 'Total',
                    currentData: check==0? 0: vm.covids.cases,
                    newData: check==0? 0:vm.covids.todayCases,
                    cardColor: CardColors.green,
                    height: (mediaQuery.size.height) * 0.21),
                Global_card(
                    cardTitle: 'RECOVERED CASES',
                    caseTitle: 'Recovered',
                    currentData: check==0? 0:vm.covids.recovered,
                    newData: 0,
                    cardColor: CardColors.blue,
                    height: (mediaQuery.size.height) * 0.21),
                Global_card(
                    cardTitle: 'DEATH CASES',
                    caseTitle: 'Deaths',
                    currentData: check==0? 0:vm.covids.deaths,
                    newData: check==0? 0:vm.covids.todayDeaths,
                    cardColor: CardColors.red,
                    height: (mediaQuery.size.height) * 0.21),
                Global_card(
                    cardTitle: 'SERIOUS CASES',
                    caseTitle: 'Serious',
                    currentData: check==0? 0:vm.covids.active,
                    newData: 0,
                    cardColor: CardColors.cyan,
                    height:
                        (mediaQuery.size.height - appBar.preferredSize.height) *
                            0.23),
              ],
            ),
          ),
        ));
  }

  _customAppBar() {
    return PreferredSize(
      preferredSize: Size.fromHeight(50),
      child: Container(
        color: Colors.black,
        child: Center(
          child: Text(
            "Covid 19",
            style: TextStyle(
                fontSize: 23, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
      ),
    );
  }
}