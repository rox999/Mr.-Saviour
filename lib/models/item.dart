class Item{

  DateTime dateTime;
  int value;

  Item({String date,int val}){
    dateTime = DateTime.parse(date);
    value = val;
  }



}