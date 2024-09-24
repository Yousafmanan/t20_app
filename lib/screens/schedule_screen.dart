import 'package:flutter/material.dart';
import 'package:t20_app/models/schedule_model.dart';
import 'package:t20_app/utility/schedule_data.dart';
class ScheduleScreen extends StatelessWidget {
  const ScheduleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        iconTheme: IconThemeData(color: Colors.white),
        title: Text("Schedule",style: TextStyle(color: Colors.white),),
      ),
      body: FutureBuilder<List<ScheduleModel>>
        (future: ScheduleData.getAllMatches(context),
          builder: (BuildContext context, AsyncSnapshot snapshot){
          if(snapshot.hasData){
            List<ScheduleModel> myData = snapshot.data;
            return ListView.builder(
                itemCount: myData.length,
                itemBuilder: (context , index){
                  ScheduleModel match = snapshot.data[index];
                  return Container(
                    margin: EdgeInsets.all(8),
                    height: 190,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.purple,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: 5,),
                        Text(match.date!,style: TextStyle(color: Colors.white, fontSize: 18),),
                        SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              children: [
                                ClipRRect
                                  (
                                    borderRadius: BorderRadius.circular(15),
                                    child: Image.asset('assets/flags/${match.flagOne}',height: 60,width: 70,)),
                                SizedBox(width: 10,),
                                Text(match.teamOne!,style: TextStyle(color: Colors.white, fontSize: 16),),
                              ],
                            ),
                            Text('vs',style: TextStyle(color: Colors.white, fontSize: 16),),
                            Row(
                              children: [
                                Text(match.teamTwo!,style: TextStyle(color: Colors.white, fontSize: 16),),
                                SizedBox(width: 10,),
                                ClipRRect(
                                    borderRadius: BorderRadius.circular(25),
                                    child: Image.asset('assets/flags/${match.flagTwo}',height: 60,width: 70,))
                              ],
                            )
                          ],
                        ),
                        SizedBox(height: 5,),
                        Text(match.venue!,style: TextStyle(color: Colors.white, fontSize: 18),),
                        Spacer(),
                        Container(
                          height: 45,
                          width: 80,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(12),topRight: Radius.circular(12)),
                          ),
                          child: Center(child: Text(match.group!,style: TextStyle(color: Colors.white, fontSize: 18),)),
                        )
                      ],
                    ),
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
