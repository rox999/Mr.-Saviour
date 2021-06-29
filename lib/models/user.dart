/*

phone number (uid)
name

salary 
house rent
any installment
house keeping

tax
electricity
water bill
phone and dth recharges
Saving
transport
grocery
shopping
other expenses
add+

*/

//
// class User{
//   String uid;
//   String phone;
//   String name;
//   List<double> salary = [];
//   List<double> houseRent = [];
//   List<double> AnyInstallment = [];
//   List<double> houseKeeping = [];
//   List<double> tax = [];
//   List<double> electricity = [];
//   List<double> water = [];
//   List<double> gas = [];
//   List<double> transport = [];
//   List<double> grocery = [];
//   List<double> shopping = [];
//   List<double> otherExpenses = [];
//
//   User({
//       this.uid,
//       this.name,
//       this.phone,
//       this.salary,
//       this.houseRent,
//       this.AnyInstallment,
//       this.houseKeeping,
//       this.tax,
//       this.electricity,
//       this.water,
//       this.gas,
//       this.transport,
//       this.grocery,
//       this.shopping,
//       this.otherExpenses
//   });
// }


class User{
  String uid;
  String name;
  String phone;

  int income;
  int dailyExpenses;

  Map<String,String>expenses;

  User({
    this.uid,
    this.name,
    this.phone,
    this.income,
    this.dailyExpenses,
    this.expenses
  });
}