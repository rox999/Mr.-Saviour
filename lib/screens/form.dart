import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mr_saviour/database/user_database.dart';
import 'package:mr_saviour/models/user.dart';
import 'package:mr_saviour/shared/constants.dart';
import 'package:provider/provider.dart';

class FormPage extends StatefulWidget {
  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final _formKey = GlobalKey<FormState>();
  String income;
  String houseRent, houseKeeping, other;
  @override
  Widget build(BuildContext context) {
    FirebaseUser user = Provider.of<FirebaseUser>(context);
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(12.0),
          child: Form(
            key: _formKey,
            child: ListView(
              physics: ScrollPhysics(),
              children: [
                Text("Your monthly income is : "),
                TextFormField(
                  decoration: textInputDecoration.copyWith(
                    hintText: '200.00',
                  ),
                  // keyboardType: TextInputType.numberWithOptions(decimal: true),
                  validator: (val) {
                    if (val.isEmpty) return "please enter valid salary";
                    return null;
                  },
                  onChanged: (val) {
                    setState(() {
                      try{
                        // income = double.parse(val);
                        setState(() {
                          income = val;
                        });
                      }catch(e){
                        print(e);
                      }
                    });
                  },
                ),
                SizedBox(height: 30.0,),
                Text("Your monthly house loan or house rent is: "),
                SizedBox(height: 10.0,),
                TextFormField(
                  decoration: textInputDecoration.copyWith(
                    hintText: '200.00',
                  ),
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  onChanged: (val) {
                    setState(() {
                      try{
                        setState(() {
                          houseRent = val;
                        });
                      }catch(e){
                        print(e);
                      }
                    });
                  },
                ),
                SizedBox(height: 30.0,),
                Text("Housekeeping monthly expenses: "),
                SizedBox(height: 10.0,),
                TextFormField(
                  initialValue: '0.0',
                  decoration: textInputDecoration.copyWith(
                    hintText: '200.00',
                  ),
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  onChanged: (val) {
                    setState(() {
                      try{
                        setState(() {
                          houseKeeping = val;
                        });
                      }catch(e){
                        print(e);
                      }
                    });
                  },
                ),
                SizedBox(height: 30.0,),
                Text("Your total monthly installments(eg. car loan, phone loan etc): "),
                SizedBox(height: 10.0,),
                TextFormField(
                  initialValue: '0.0',
                  decoration: textInputDecoration.copyWith(
                    hintText: '200.00',
                  ),
                  keyboardType: TextInputType.numberWithOptions(decimal: true),

                  onChanged: (val){
                    setState(() {
                      try{
                        setState(() {
                          other = val;
                        });
                      }catch(e){
                        print(e);
                      }
                    });
                  },
                ),
                SizedBox(height: 30),

                MaterialButton(
                    color: Colors.teal,
                    child: Text("Confirm"),
                    onPressed: (){
                      if(_formKey.currentState.validate()){
                        Map<String,String>mp = Map();
                        mp["houserent"] = houseRent.toString();
                        mp["houseKeeping"] = houseKeeping.toString();
                        mp["other"] = other.toString();
                        UserDatabase(uid:user.uid).updateUserData(User(uid:user.uid,name:income.toString() ,expenses: mp));
                      }
                    }
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
