import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mr_saviour/models/item.dart';
import 'package:mr_saviour/models/user.dart';
import 'package:mr_saviour/screens/setting_page.dart';
import 'Graphs/lineChart.dart';
import 'notifications.dart';
import 'setting_page.dart';

class Home extends StatefulWidget {
  User user;
  Home({this.user});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  DateTime dt = DateTime.now();

  List<Item> transport = [];
  List<Item> savings = [];
  List<Item> householdBills = [];
  List<Item> tax = [];
  List<Item> houseKeeping = [];
  List<Item> shopping = [];
  List<Item> grocery = [];
  List<Item> otherExpanses = [];
  int todayRemain = 0;

  void initiateState() {
    todayRemain = widget.user.dailyExpenses;
    dynamic cacheList = widget.user.expenses["TRANSPORT"].split(',');
    List<Item> cacheItem = [];
    if (cacheList[0].isNotEmpty)
      for (int i = 0; i < cacheList.length; ++i) {
        DateTime date = DateTime.parse(cacheList[i].split("=")[0]);
        cacheItem.add(Item(
            date: cacheList[i].split("=")[0],
            val: int.parse(cacheList[i].split("=")[1])));
        if (dt.year == date.year &&
            dt.month == date.month &&
            dt.day == date.day) {
          todayRemain -= int.parse(cacheList[i].split("=")[1]);
        }
      }
    transport = cacheItem;
    cacheItem = [];

    cacheList = widget.user.expenses["HOUSEHOLD BILLS"].split(',');
    if (cacheList[0].isNotEmpty)
      for (int i = 0; i < cacheList.length; ++i) {
        DateTime date = DateTime.parse(cacheList[i].split("=")[0]);
        cacheItem.add(Item(
            date: cacheList[i].split("=")[0],
            val: int.parse(cacheList[i].split("=")[1])));
        if (dt.year == date.year &&
            dt.month == date.month &&
            dt.day == date.day) {
          todayRemain -= int.parse(cacheList[i].split("=")[1]);
        }
      }
    householdBills = cacheItem;
    cacheItem = [];

    cacheList = widget.user.expenses["TAX"].split(',');
    if (cacheList[0].isNotEmpty)
      for (int i = 0; i < cacheList.length; ++i) {
        DateTime date = DateTime.parse(cacheList[i].split("=")[0]);
        cacheItem.add(Item(
            date: cacheList[i].split("=")[0],
            val: int.parse(cacheList[i].split("=")[1])));
        if (dt.year == date.year &&
            dt.month == date.month &&
            dt.day == date.day) {
          todayRemain -= int.parse(cacheList[i].split("=")[1]);
        }
      }
    tax = cacheItem;
    cacheItem = [];

    cacheList = widget.user.expenses["HOUSE KEEPING"].split(',');
    if (cacheList[0].isNotEmpty)
      for (int i = 0; i < cacheList.length; ++i) {
        DateTime date = DateTime.parse(cacheList[i].split("=")[0]);
        cacheItem.add(Item(
            date: cacheList[i].split("=")[0],
            val: int.parse(cacheList[i].split("=")[1])));
        if (dt.year == date.year &&
            dt.month == date.month &&
            dt.day == date.day) {
          todayRemain -= int.parse(cacheList[i].split("=")[1]);
        }
      }
    houseKeeping = cacheItem;
    cacheItem = [];

    cacheList = widget.user.expenses["SHOPPING"].split(',');
    if (cacheList[0].isNotEmpty)
      for (int i = 0; i < cacheList.length; ++i) {
        DateTime date = DateTime.parse(cacheList[i].split("=")[0]);
        cacheItem.add(Item(
            date: cacheList[i].split("=")[0],
            val: int.parse(cacheList[i].split("=")[1])));
        if (dt.year == date.year &&
            dt.month == date.month &&
            dt.day == date.day) {
          todayRemain -= int.parse(cacheList[i].split("=")[1]);
        }
      }
    shopping = cacheItem;
    cacheItem = [];

    cacheList = widget.user.expenses["GROCERY"].split(',');
    if (cacheList[0].isNotEmpty)
      for (int i = 0; i < cacheList.length; ++i) {
        DateTime date = DateTime.parse(cacheList[i].split("=")[0]);
        cacheItem.add(Item(
            date: cacheList[i].split("=")[0],
            val: int.parse(cacheList[i].split("=")[1])));
        if (dt.year == date.year &&
            dt.month == date.month &&
            dt.day == date.day) {
          todayRemain -= int.parse(cacheList[i].split("=")[1]);
        }
      }
    grocery = cacheItem;
    cacheItem = [];

    cacheList = widget.user.expenses["OTHER EXPENSES"].split(',');
    if (cacheList[0].isNotEmpty)
      for (int i = 0; i < cacheList.length; ++i) {
        DateTime date = DateTime.parse(cacheList[i].split("=")[0]);
        cacheItem.add(Item(
            date: cacheList[i].split("=")[0],
            val: int.parse(cacheList[i].split("=")[1])));
        if (dt.year == date.year &&
            dt.month == date.month &&
            dt.day == date.day) {
          todayRemain -= int.parse(cacheList[i].split("=")[1]);
        }
      }
    otherExpanses = cacheItem;
    cacheItem = [];
  }

  @override
  Widget build(BuildContext context) {
    initiateState();
    // if(widget.user.expenses["TRANSPORT"].split(",").length >2){
    //   transport = widget.user.expenses["TRANSPORT"].split(",").map((e) => Item(date: e.split("=")[0],val:int.parse(e.split("=")[1]) )).toList();
    // }
    // print(widget.user.expenses["TRANSPORT"]);
    // print(DateTime.now().toIso8601String());
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(

          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.bottomRight,
                    end: Alignment.topLeft,
                    colors: [
                      Color.fromRGBO(129, 229, 169, 0.3),
                      Color.fromRGBO(229, 243, 234, 0.3),
                       //green
                    ]),),
            child: Column(

              children: <Widget>[
                Card(
                  elevation: 10.5,
                  margin: EdgeInsets.only(
                      left: 10, right: 10.0, bottom: 20.0, top: 8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.bottomRight,
                            end: Alignment.topLeft,
                            colors: [
                          Color.fromRGBO(229, 253, 248, 0.5),
                          Color.fromRGBO(129, 249, 169, 1), //green
                        ])),
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(12.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: Text(
                                  "Hey " + widget.user.name + " !",
                                  softWrap: true,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                  style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Row(
                                children: [
                                  IconButton(
                                    icon: Icon(Icons.notifications),
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (_) => Notifications()));
                                    },
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.settings),
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (_) => SettingPage()));
                                    },
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(12.0),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Wallet : ${todayRemain.toString()} \$",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                              ),

                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(5.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Row(
                                    children: [

                                      Icon(Icons.attach_money),
                                      SizedBox(
                                        width: 6.0,
                                      ),
                                      Text(
                                          "8000",
                                        style: TextStyle(
                                          fontSize: 20,
                                        ),

                                      ),
                                    ],
                                  ),
                                  Text(
                                      "Remaining this month",
                                    style: TextStyle(
                                      fontSize: 17,
                                      color: Colors.black38,
                                    ),

                                  ),

                                ],
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.attach_money),
                                      SizedBox(
                                        width: 6.0,
                                      ),
                                      Text(
                                          "4000",
                              style: TextStyle(
                                fontSize: 20,
                              ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                      "Expected Savings",
                                      style: TextStyle(
                                      fontSize: 17,
                                      color: Colors.black38,
                                    ),

                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                GridView.count(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  crossAxisCount: 2,
                  physics: ScrollPhysics(),
                  children: [
                    singleCard("TRANSPORT", Icons.directions_walk,
                        [224, 240, 116], transport),
                    singleCard(
                        "SAVINGS", Icons.money, [212, 100, 150], savings),
                    singleCard("HOUSEHOLD BILLS", Icons.house, [111, 130, 116],
                        householdBills),
                    singleCard("TAX", Icons.trending_up, [254, 111, 116], tax),
                    singleCard("HOUSE KEEPING", Icons.cleaning_services,
                        [120, 250, 224], houseKeeping),
                    singleCard("SHOPPING", Icons.shopping_cart, [111, 111, 156],
                        shopping),
                    singleCard("GROCERY", Icons.shopping_basket,
                        [200, 150, 123], grocery),
                    singleCard("OTHER EXPENSES", Icons.monetization_on,
                        [67, 123, 123], otherExpanses),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  int countTotal(List<Item> items) {
    int total = 0;
    for (Item item in items) {
      if (item.dateTime.month == dt.month) total += item.value;
    }
    return total;
  }

  Widget singleCard(String name, IconData icon, l, List<Item> items) {
    int total = countTotal(items);

    return SingleChildScrollView(
      child: GestureDetector(
        onTap: (){
          Navigator.of(context).push(
            PageRouteBuilder(
              opaque: false, // set to false
              pageBuilder: (_, __, ___) => LineChartGraph(items),
            ),
          );
        },
        child: Card(
          margin: EdgeInsets.only(left: 12.0),
          // semanticContainer: true,
          elevation: 10.0,
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                  Color.fromRGBO(l[0], l[1], l[2], 0.2),
                  Color.fromRGBO(l[0], l[1], l[2], 0.4),
                  Color.fromRGBO(l[0], l[1], l[2], 0.6),
                  Color.fromRGBO(l[0], l[1], l[2], 0.8),
                  Color.fromRGBO(l[0], l[1], l[2], 0.9),
                ])),
            padding: EdgeInsets.all(10.0),2

            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Column(
                        children: [
                          CircleAvatar(
                            backgroundColor:
                                Color.fromRGBO(l[0], l[1], l[2], 1),
                            child: IconButton(
                              icon: Icon(
                                icon,
                                color: Colors.black,
                              ),
                            ),),
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: () {

                      },
                      icon: Icon(Icons.add),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child:
                      Align(alignment: Alignment.centerLeft, child: Text(name)),
                ),
                Row(
                  children: [
                    Column(
                      children: [
                        Text(
                          "this\nmonth :",
                          textAlign: TextAlign.start,
                        )
                      ],
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Icon(Icons.attach_money),
                    Text(
                      total.toString(),
                      style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text('Last Trans.'),
                    Icon(
                      Icons.attach_money,
                      size: 15,
                    ),
                    Text(items.length > 0
                        ? items[items.length - 1].value.toString()
                        : "null"),
                  ],
                ),
                Align(
                    alignment: Alignment.bottomRight,
                    child: Text(items.length > 0
                        ? stringToDate(items[items.length - 1].dateTime)
                        : "null")),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String stringToDate(DateTime dt) {
    return dt.day.toString() +
        " - " +
        dt.month.toString() +
        " - " +
        dt.year.toString();
  }
}
