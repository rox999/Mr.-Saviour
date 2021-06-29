import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mr_saviour/database/user_database.dart';
import 'package:mr_saviour/models/user.dart';
import 'package:mr_saviour/screens/authenticateScreen/register.dart';
import 'package:mr_saviour/screens/home.dart';
import 'package:mr_saviour/shared/loading.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatefulWidget {
  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {


  @override
  Widget build(BuildContext context) {
    FirebaseUser user = Provider.of<FirebaseUser>(context);
    if(user == null){
      return Register();
    }
    return StreamProvider.value(
        value: UserDatabase(uid: user.uid).user,
        initialData: null,
      child: HomeWrapper(),
    );
  }
}

class HomeWrapper extends StatefulWidget {
  @override
  _HomeWrapperState createState() => _HomeWrapperState();
}

class _HomeWrapperState extends State<HomeWrapper> {
  @override
  Widget build(BuildContext context) {
    User user = Provider.of<User>(context);
    return (user==null)?Loading():Home(user:user);
  }
}

