import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mr_saviour/models/user.dart';

class UserDatabase{

  String uid;
  UserDatabase({this.uid});

  final CollectionReference collectionReference = Firestore.instance.collection('user');

  Future updateUserData(User user) async {
    return await collectionReference.document(uid).setData({
        "phone" :user.phone,
        "name" : user.name,
        "income":user.income,
        "dailyExpenses":user.dailyExpenses,
        "expanses":user.expenses
      }
    );
  }

  Future createEmptyData(User user) async {
    return await collectionReference.document(uid).updateData({
      "name" : user.name,
      "income":user.income,
      "dailyExpenses":user.dailyExpenses,
      "expanses":user.expenses
    });
  }

  Future updateUserName(String name)async{
    await collectionReference.document(uid).updateData({
      "name":name
    });
  }

  Future updateDailyLimit(int limit)async{
    await collectionReference.document(uid).updateData({
      "dailyExpenses":limit
    });
  }

  Future updateIncome(int income)async{
    await collectionReference.document(uid).updateData({
      "income":income
    });
  }

  Future updateDailyExpense(Map<String,String>mp)async{
    await collectionReference.document(uid).updateData({
      "expanses":mp
    });
  }

  Map<String,String> dynamicToStringMap(mp){
    Map<String,String>res = Map();
    if(mp!=null)
    mp.forEach((key, value) {
      res[key.toString()] = value.toString();
    });
    return res;
  }

  Stream<User> get user {
    Stream<DocumentSnapshot> user = collectionReference.document(uid).snapshots();
    return user.map((snapshot) {
      return User(
          uid: uid,
          name: snapshot.data["name"],
          phone: snapshot.data["phone"],
          dailyExpenses: snapshot.data["dailyExpenses"],
          income:snapshot.data["income"],
          expenses: dynamicToStringMap(snapshot.data["expanses"])
      );
    });
  }




}


// "salary" : user.salary,
// "houseRent" : user.houseRent,
// "houseKeeping" : user.houseKeeping,
// "electricity" : user.electricity,
// "water" : user.water,
// "gas" : user.gas,
// "anyInstallment" : user.AnyInstallment,
// "transport" : user.transport,
// "grocery" : user.grocery,
// "otherExpense" : user.otherExpenses,
// "shopping" : user.shopping,
// "tax" : user.tax,

// salary: snapshot.data["salary"],
// houseRent: snapshot.data["houseRent"],
// houseKeeping: snapshot.data["houseKeeping"],
// electricity: snapshot.data["electricity"],
// water: snapshot.data["water"],
// gas: snapshot.data["gas"],
// AnyInstallment: snapshot.data["anyInstallment"],
// transport: snapshot.data["transport"],
// grocery: snapshot.data["grocery"],
// tax: snapshot.data["tax"],
// shopping: snapshot.data["shopping"],
// otherExpenses: snapshot.data["otherExpenses"],