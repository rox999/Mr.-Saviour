import 'package:firebase_auth/firebase_auth.dart';

class AuthService{

  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Stream<FirebaseUser>get authChange {
    return _firebaseAuth.onAuthStateChanged;
  }

    Future signOut()async{
      try{
        await _firebaseAuth.signOut();
      }catch(e){
        print(e);
      }
    }

}
