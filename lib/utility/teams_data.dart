import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:t20_app/models/teams_model.dart';

class TeamsData{
  
  static Future<List<TeamsModel>> getAllTeams(BuildContext context) async{
    Future.delayed(Duration(seconds: 1));
    await Future.delayed(Duration(seconds: 1));
    // put all the data in this list
    var matches = <TeamsModel>[];
    //read data from json
    var assetsBundle = DefaultAssetBundle.of(context);
    var data = await assetsBundle.loadString('assets/ttwenty.json');
    var jsonData = json.decode(data);
    var teamsData = jsonData['teams'];
    for(var matchesData in teamsData){
      TeamsModel teamsModel = TeamsModel.fromJSON(matchesData);
      matches.add(teamsModel);
    }
    return matches;
  }
}