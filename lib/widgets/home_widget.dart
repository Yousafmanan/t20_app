import 'package:flutter/material.dart';
class HomeWidget extends StatelessWidget {
  String title;
  VoidCallback onPress;
  IconData icon;

   HomeWidget({
    super.key,
    required this.title,
    required this.onPress,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.purple,
            borderRadius: BorderRadius.circular(15)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon,color: Colors.white,size: 80,),
            SizedBox(height: 10,),
            Text(title,style: TextStyle(color: Colors.white,fontSize: 30),)
          ],
        ),
      ),
    );
  }
}