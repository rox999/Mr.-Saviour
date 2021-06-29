import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:mr_saviour/models/item.dart';

class LineChartGraph extends StatefulWidget {

  List<Item> items;
  LineChartGraph(this.items);

  @override
  _LineChartGraphState createState() => _LineChartGraphState();
}

class _LineChartGraphState extends State<LineChartGraph> {
  List<Color> gradientColors = [
    const Color(0xff23b6e6),
    const Color(0xff02d39a),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        color: Color.fromRGBO(155, 155, 155, 0.3),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            // color: Color.fromRGBO(155, 155, 155, 0.7),
            decoration: BoxDecoration(
              color: Color.fromRGBO(155, 155, 155, 0.7),
              borderRadius: BorderRadius.only(
                topRight:Radius.circular(18),
                topLeft:Radius.circular(18),
              ),
            ),
            alignment: Alignment.topRight,
            child: FlatButton(
              child: Icon(Icons.clear,size: 35,),
              onPressed: () {
                setState(() {
                  Navigator.pop(context);
                });
              },
            ),
          ),
          AspectRatio(
            aspectRatio: 1.5,
            child: Container(
              //color: Color.fromRGBO(155, 155, 155, 0.7),
              decoration: BoxDecoration(
                color: Color.fromRGBO(155, 155, 155, 0.7),
                borderRadius: BorderRadius.only(
                  bottomRight:Radius.circular(18),
                  bottomLeft:Radius.circular(18),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(right: 18.0, left: 12.0, top: 24, bottom: 12),
                child: LineChart(
                  mainData(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  LineChartData mainData() {

    for(Item item in widget.items){
      print(item.value.toString() +" "+item.dateTime.day.toString() );
    }

    return LineChartData(
      // gridData: FlGridData(
      //   show: true,
      //   drawVerticalLine: true,
      //   getDrawingHorizontalLine: (value) {
      //     return FlLine(
      //       color: const Color(0xff37434d),
      //       strokeWidth: 1,
      //     );
      //   },
      //   getDrawingVerticalLine: (value) {
      //     return FlLine(
      //       color: const Color(0xff37434d),
      //       strokeWidth: 1,
      //     );
      //   },
      // ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 22,
          getTextStyles: (value) =>
          const TextStyle(color: Color(0xff68737d), fontWeight: FontWeight.bold, fontSize: 16),
          getTitles: (value) {
            switch (value.toInt()) {
              case 2:
                return 'MAR';
              case 5:
                return 'JUN';
              case 8:
                return 'SEP';
            }
            return '';
          },
          margin: 8,
        ),
        leftTitles: SideTitles(
          showTitles: true,
          getTextStyles: (value) => const TextStyle(
            color: Color(0xff67727d),
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
          getTitles: (value) {
            switch (value.toInt()) {
              case 1:
                return '10k';
              case 3:
                return '30k';
              case 5:
                return '50k';
            }
            return '';
          },
          reservedSize: 28,
          margin: 12,
        ),
      ),
      borderData:
      FlBorderData(show: true, border: Border.all(color: const Color(0xff37434d), width: 1)),
      minX: 0,
      maxX: 30,
      minY: 0,
      maxY: 50,
      lineBarsData: [
        LineChartBarData(
          spots: widget.items.map((e) {
            return FlSpot(e.dateTime.day.toDouble(),e.value.toDouble());
          }

          ).toList(),
          isCurved: true,
          colors: gradientColors,
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            colors: gradientColors.map((color) => color.withOpacity(0.3)).toList(),
          ),
        ),
      ],
    );
  }

}

// [
// FlSpot(0, 3),
// FlSpot(2.6, 2),
// FlSpot(4.9, 5),
// FlSpot(6.8, 3.1),
// FlSpot(8, 4),
// FlSpot(9.5, 3),
// FlSpot(11, 4),
// ],