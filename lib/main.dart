import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mr_saviour/authentication/auth.dart';
import 'package:mr_saviour/screens/authenticateScreen/otp_verification_page.dart';
import 'package:mr_saviour/screens/authenticateScreen/reg.dart';
import 'package:mr_saviour/screens/home.dart';
import 'package:mr_saviour/screens/wrapper.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<FirebaseUser>.value(
      initialData: null,
      value: AuthService().authChange,
      child: MaterialApp(
        debugShowCheckedModeBanner:  false,
        theme: ThemeData(
          primarySwatch: Colors.blueGrey,
        ),
        home: Register(),
      ),
    );
  }
}

