import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:t20_app/models/schedule_model.dart';

class ScheduleData{

  static Future<List<ScheduleModel>> getAllMatches(BuildContext context)async{
    // delay data for 1 second
    await Future.delayed(Duration(seconds: 1));
    // put all the data in this list
    var matches = <ScheduleModel>[];
    //read data from json
    var assetsBundle = DefaultAssetBundle.of(context);
    var data =  await assetsBundle.loadString('assets/ttwenty.json');
    var jsonData = json.decode(data);
    var scheduleData = jsonData['schedule'];
    for(var matchesData in scheduleData){
      ScheduleModel scheduleModel = ScheduleModel.fromJSON(matchesData);
      matches.add(scheduleModel);
    }
    return matches;
  }
}