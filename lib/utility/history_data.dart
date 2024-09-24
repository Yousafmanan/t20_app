import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:t20_app/models/history_model.dart';

class HistoryData {

  static Future<List<HistoryModel>> getAllHistory(BuildContext context) async {
    // delay data for 1 second
    await Future.delayed(Duration(seconds: 1));
    // put all the data in this list
    var matches = <HistoryModel>[];
    //read data from json
    var assetsBundle = DefaultAssetBundle.of(context);
    var data = await assetsBundle.loadString('assets/ttwenty.json');
    var jsonData = json.decode(data);
    var historyData = jsonData['history'];
    for (var matchesData in historyData) {
      HistoryModel historyModel = HistoryModel.fromJSON(matchesData);
      matches.add(historyModel);
    }
    return matches;
  }
}