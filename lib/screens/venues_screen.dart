import 'package:flutter/material.dart';
import 'package:t20_app/models/venues_model.dart';
import 'package:t20_app/utility/venues_data.dart';

class VenuesScreen extends StatelessWidget {
  const VenuesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.purple,
        title: Text('Venues', style: TextStyle(color: Colors.white),),
      ),
      body: FutureBuilder <List<VenuesModel>>
        (future: VenuesData.getAllVenues(context),
          builder: (context, AsyncSnapshot snapshot){
          if(snapshot.hasData){
            List<VenuesModel> myData = snapshot.data;
            print(myData.length);
            return ListView.builder(
                itemCount: myData.length,
                itemBuilder: (context,index){
                  VenuesModel match = snapshot.data[index];
                  return Container(
                    margin: EdgeInsets.all(8),
                    height: 250,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white ,
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child:Column(
                      children: [
                        SizedBox(height: 5),
                        Text('Country: ${match.country!}', style: TextStyle(color: Colors.black, fontSize: 20),),
                        SizedBox(height: 10,),
                        Text('City: ${match.city!}', style: TextStyle(color: Colors.black, fontSize: 20),),
                        SizedBox(height: 5,),
                        Text(match.stadium!, style: TextStyle(color: Colors.black, fontSize: 20),),
                        SizedBox(height: 5,),
                        Expanded(
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.asset(match.image!,width: double.infinity, fit: BoxFit.cover,))),
                      ],
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
