
import 'package:flutter/material.dart';
import 'package:t20_app/screens/history_screen.dart';
import 'package:t20_app/screens/home_screen.dart';
import 'package:t20_app/screens/schedule_screen.dart';
import 'package:t20_app/screens/teams_screen.dart';
import 'package:t20_app/screens/venues_screen.dart';
import 'package:t20_app/utils/routes_name.dart';

class Routes {

  static Route<dynamic> generateRoute (RouteSettings settings){
    switch(settings.name){

      case RouteName.homeScreen:
        return MaterialPageRoute(builder: (context) => HomeScreen());
      case RouteName.historyScreen:
        return MaterialPageRoute(builder: (context) => HistoryScreen());
      case RouteName.scheduleScreen:
        return MaterialPageRoute(builder: (context) => ScheduleScreen());
      case RouteName.teamsScreen:
        return MaterialPageRoute(builder: (context) => TeamsScreen());
      case RouteName.venuesScreen:
        return MaterialPageRoute(builder: (context) => VenuesScreen());
      default:
        return MaterialPageRoute(builder: (context){
          return Scaffold(
            body: Center(child: Text('No Route Defined')),
          );
        });
    }
  }

}