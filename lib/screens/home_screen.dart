import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:t20_app/utils/routes_name.dart';
import 'package:url_launcher/url_launcher.dart';
import '../utility/connectivity.dart';
import '../widgets/home_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) { 
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.purple,
        title: Text('T20 World Cup',style: TextStyle(color: Colors.white),),
        actions: [
          Icon(Icons.star,size: 30,color: Colors.white,),
          SizedBox(width: 10,),
        ],
      ),
      drawer: Drawer(
        backgroundColor: Colors.grey,
        child: Column(
          children: [
            SizedBox(
              height: 200,
              width: double.infinity,
              child: DrawerHeader(
                decoration: BoxDecoration(color: Colors.purple),
                child: Column(
                  children: [
                    Icon(Icons.sports_cricket, color: Colors.white, size: 50,),
                    SizedBox(height: 15,),
                    Text('T20 World Cup', style: TextStyle(color: Colors.white, fontSize: 25),),
                  ],
                ),
              ),
            ),

            ListTile(
              onTap: (){
                Navigator.of(context).pop();
              },
              leading: Icon(Icons.home, color: Colors.white),
              title: Text('Home', style: TextStyle(color: Colors.white)),
            ),
            ListTile(
              onTap: (){
                Navigator.pushNamed(context, RouteName.scheduleScreen);
              },
              leading: Icon(Icons.access_time, color: Colors.white),
              title: Text('Schedule', style: TextStyle(color: Colors.white),),
            ),
            ListTile(
              onTap: (){
                Navigator.pushNamed(context, RouteName.venuesScreen);
              },
              leading: Icon(Icons.live_tv, color: Colors.white),
              title: Text('Venues', style: TextStyle(color: Colors.white)),
            ),
            ListTile(
              onTap: (){
                Navigator.pushNamed(context, RouteName.historyScreen);
              },
              leading: Icon(Icons.history, color: Colors.white),
              title: Text('History', style: TextStyle(color: Colors.white)),
            ),
            ListTile(
              onTap: (){
                Navigator.pushNamed(context, RouteName.teamsScreen);
              },
              leading: Icon(Icons.group, color: Colors.white),
              title: Text('Teams', style: TextStyle(color: Colors.white)),
            ),
            Divider(color: Colors.white, thickness: 1,),
            ListTile(
              leading: Icon(Icons.star, color: Colors.white),
              title: Text('Rate App', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    body: Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10
        ),
        children: [
         HomeWidget(title: 'Schedule',onPress: (){
           Navigator.pushNamed(context, RouteName.scheduleScreen);
         },icon: Icons.access_time,),
         HomeWidget(title: 'Venues', onPress: (){
           Navigator.pushNamed(context, RouteName.venuesScreen);
         }, icon: Icons.location_on_outlined),
         HomeWidget(title: 'History', onPress: (){
           Navigator.pushNamed(context, RouteName.historyScreen);
         }, icon: Icons.history),
         HomeWidget(title: 'Teams', onPress: (){
           Navigator.pushNamed(context, RouteName.teamsScreen);
         }, icon: Icons.group),
         HomeWidget(title: 'Live Score', onPress: ()async{
           var _url = 'https://www.icc-cricket.com/';
           if(await ConnectivityData().isConnected()){
             if(! await launchUrl(Uri.parse(_url))) throw 'Could not launch $_url';
           }else{
             Fluttertoast.showToast(
               gravity: ToastGravity.CENTER,
                 msg: 'Please Provide Internet Connection',
                 backgroundColor: Colors.white,
                 textColor: Colors.purple);
           }
         }, icon: Icons.live_tv),
         HomeWidget(title: 'Highlights', onPress: ()async{
           var _url1 = 'https://www.youtube.com/';
           if(await ConnectivityData().isConnected()){
             if(!await launchUrl(Uri.parse(_url1))) throw 'Could not launch $_url1';
           } else{
             Fluttertoast.showToast(
                 gravity: ToastGravity.CENTER,
                 msg: 'Please Provide Internet Connection',
                 backgroundColor: Colors.white,
                 textColor: Colors.purple);
           }
         }, icon: Icons.video_call_outlined)
        ],
      ),
    ),
    );

  }
}
