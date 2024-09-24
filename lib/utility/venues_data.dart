import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:t20_app/models/venues_model.dart';

class VenuesData{
  
  static Future<List<VenuesModel>> getAllVenues (BuildContext context) async{
    await Future.delayed(Duration(seconds: 1));
    var matches = <VenuesModel>[];
    var assetsBundle = DefaultAssetBundle.of(context);
    var data = await assetsBundle.loadString('assets/ttwenty.json');
    var jsonData = json.decode(data);
    var venuesData = jsonData['venues'];
    for(var matchesData in venuesData){
      VenuesModel venuesModel = VenuesModel.fromJSON(matchesData);
      matches.add(venuesModel);
    }
    return matches;
  }
}