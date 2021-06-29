import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mr_saviour/authentication/auth.dart';
import 'package:mr_saviour/database/user_database.dart';
import 'package:mr_saviour/models/user.dart';
import 'package:provider/provider.dart';

class SettingPage extends StatelessWidget {

  List<String>actionList = ["change name","change income ","change daily limit","clear data","log out"];
  List<IconData>iconList = [Icons.person,Icons.monetization_on_outlined,Icons.pause_circle_outline,Icons.clear,Icons.logout];

void pressButton(int index,BuildContext context,String uid)async{
  if(index == 0){
    String name;
    showDialog(context: context, builder: (_){
      return AlertDialog(
        title: Text("Update your name "),
        content: TextFormField(
          onChanged: (val){
            name = val;
          },
        ),
        actions: [
          RaisedButton(
              child: Text("ok"),
              onPressed: ()async{
                Navigator.pop(context);
                await UserDatabase(uid: uid).updateUserName(name);
              }
              ),
          RaisedButton(
              child: Text("cancel"),
              onPressed: (){
                Navigator.pop(context);
              }
          )
        ],
      );
    });

  }else if(index==1){
    int income;
    showDialog(context: context, builder: (_){
      return AlertDialog(
        title: Text("Update your income "),
        content: TextFormField(
          keyboardType: TextInputType.number,
          onChanged: (val){
            income = int.parse(val);
          },
        ),
        actions: [
          RaisedButton(
              child: Text("ok"),
              onPressed: ()async{
                Navigator.pop(context);
                await UserDatabase(uid: uid).updateIncome(income);
              }
          ),
          RaisedButton(
              child: Text("cancel"),
              onPressed: (){
                Navigator.pop(context);
              }
          )
        ],
      );
    });
  }else if(index==2){
    int dailyLimit;
    showDialog(context: context, builder: (_){
      return AlertDialog(
        title: Text("Update your daily limit "),
        content: TextFormField(
          keyboardType: TextInputType.number,
          onChanged: (val){
            dailyLimit = int.parse(val);
          },
        ),
        actions: [
          RaisedButton(
              child: Text("ok"),
              onPressed: ()async{
                Navigator.pop(context);
                await UserDatabase(uid: uid).updateDailyLimit(dailyLimit);
              }
          ),
          RaisedButton(
              child: Text("cancel"),
              onPressed: (){
                Navigator.pop(context);
              }
          )
        ],
      );
    });
  }
  else if(index == 3){

    showDialog(context: context, builder: (_){
      return AlertDialog(
        title: Text("are you sure ? "),
        actions: [
          RaisedButton(
              child: Text("Yes"),
              onPressed: ()async{

                Map<String,String>mp = Map();

                mp["TRANSPORT"] = "";
                mp["SAVINGS"] = "";
                mp["HOUSEHOLD BILLS"] = "";
                mp["TAX"] = "";
                mp["HOUSE KEEPING"] = "";
                mp["SHOPPING"] = "";
                mp["GROCERY"] = "";
                mp["OTHER EXPENSES"] = "";

                UserDatabase(uid: uid).createEmptyData(
                    User(
                        uid: uid,
                        name: "Mr. Saviour ",
                        income: 20000,
                        dailyExpenses: 500,
                        expenses:mp
                    ));
                Navigator.pop(context);
              }
          ),
          RaisedButton(
              child: Text("no"),
              onPressed: (){
                Navigator.pop(context);
              }
          )
        ],
      );
    });
  }
  else if(index==4){
   await AuthService().signOut();
   Navigator.pop(context);
  }
}

  @override
  Widget build(BuildContext context) {

  FirebaseUser user = Provider.of<FirebaseUser>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 12,horizontal: 8.0),
        child: ListView.builder(
          itemCount: actionList.length,
            itemBuilder:(contex,index){
            return ListTile(
              leading: Icon(iconList[index]),
              title: Text(actionList[index]),
              onTap:()=> pressButton(index,context,user.uid),
            );
            }
        ),
      ),
    );
  }
}
