import 'package:flutter/material.dart';

class Notifications extends StatefulWidget {



  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {

  List<String>notificationList = ["clear data","log out"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 12,horizontal: 8.0),
        child: ListView.builder(
            itemCount: notificationList.length,
            itemBuilder: (context, index){
              return ListTile(
                leading: Icon(Icons.notifications),
                title: Text(notificationList[index]),
              );
            }
        ),
      ),
    );
  }
}

