import 'package:flutter/material.dart';
import 'package:t20_app/models/teams_model.dart';
import 'package:t20_app/utility/teams_data.dart';
class TeamsScreen extends StatelessWidget {
  const TeamsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        iconTheme: IconThemeData(color: Colors.white),
        title:Text('Teams',style: TextStyle(color: Colors.white),),
      ),
      body: FutureBuilder <List<TeamsModel>>
        (future: TeamsData.getAllTeams(context),
          builder: (BuildContext context, AsyncSnapshot snapshot){
          if(snapshot.hasData){
            List<TeamsModel> myData = snapshot.data;
            return ListView.builder(
                itemCount: myData.length,
                itemBuilder: (context,index){
                  TeamsModel match = snapshot.data[index];
                  return Container(
                    margin: EdgeInsets.all(5),
                    height: 100,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.purple,
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child:Center(
                      child: ListTile(
                        leading: ClipRRect(
                          // borderRadius: BorderRadius.circular(20),
                            child: Image.asset(match.flag!,height: 120,width: 100,)),
                        title: Text(match.fullName!,style: TextStyle(color: Colors.white),),
                        // subtitle: Text(match.shortName!, style: TextStyle(color: Colors.white),),
                      ),
                    ) ,
                  );
                });
          }
          else{
            return const Center(
                child: CircularProgressIndicator()
            );
          }
          })
    );
  }
}
