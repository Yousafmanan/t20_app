import 'package:flutter/material.dart';
import 'package:t20_app/models/history_model.dart';
import 'package:t20_app/utility/history_data.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        iconTheme: IconThemeData(color: Colors.white),
        title: Text("History",style: TextStyle(color: Colors.white),),
      ),
      body: FutureBuilder <List<HistoryModel>>
        (future: HistoryData.getAllHistory(context),
          builder: (BuildContext context, AsyncSnapshot snapshot){
          if(snapshot.hasData){
            List<HistoryModel> myData = snapshot.data;
            return ListView.builder(
                itemCount: myData.length,
                itemBuilder: (context , index){
                  HistoryModel match = snapshot.data[index];
                  return Container(
                    margin: EdgeInsets.all(8),
                    height: 170,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.purple,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Hosted By ${match.host!}',style: TextStyle(color: Colors.white, fontSize: 18),),
                            SizedBox(width: 5,),
                            Text('(${match.year!})', style: TextStyle(color: Colors.white, fontSize: 18),),
                          ],
                        ),
                        SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Winner', style: TextStyle(color: Colors.white, fontSize: 18),),
                            SizedBox(width: 120,),
                            Text('Runner Up', style: TextStyle(color: Colors.white, fontSize: 18),),
                          ],
                        ),
                        SizedBox(height: 5,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              children: [
                                ClipRRect
                                  (
                                    borderRadius: BorderRadius.circular(15),
                                    child: Image.asset('assets/flags/${match.winnerFlag!}',height: 60,width: 70,)),
                                SizedBox(width: 10,),
                                Text(match.winner!,style: TextStyle(color: Colors.white, fontSize: 16),),
                              ],
                            ),
                            Text('vs',style: TextStyle(color: Colors.white,fontSize: 16),),
                            Row(
                              children: [
                                Text(match.runnerUp!,style: TextStyle(color: Colors.white, fontSize: 16),),
                                SizedBox(width: 10,),
                                ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Image.asset('assets/flags/${match.runnerUpFlag!}',height: 60,width: 70,))
                              ],
                            )
                          ],
                        ),
                        SizedBox(height: 5,),
                        Spacer(),
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
