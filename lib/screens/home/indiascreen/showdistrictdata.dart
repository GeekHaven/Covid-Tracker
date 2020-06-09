
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import '../home_widgets/infoCardset.dart';



class ShowDistrictData extends StatefulWidget {
  var districtData;
  var index;
  ShowDistrictData({this.districtData, this.index});
  @override
  _ShowDistrictDataState createState() => _ShowDistrictDataState();
}

class _ShowDistrictDataState extends State<ShowDistrictData> {
  bool toggle = false;
  var myDistrictData;
  var index;
  Map<String, double> dataMap = Map();
  List<Color> colorList = [
    Colors.red,
    Colors.green,
    Colors.yellow,
  ];

  @override
  void initState() {
    super.initState();
    myDistrictData = widget.districtData;
    index = widget.index;
    dataMap.putIfAbsent("Deaths",
        () => double.parse((myDistrictData[index]["deceased"]).toString()));
    dataMap.putIfAbsent("Recovered",
        () => double.parse((myDistrictData[index]["recovered"]).toString()));
    dataMap.putIfAbsent("Active",
        () => double.parse((myDistrictData[index]["active"]).toString()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(myDistrictData[index]["district"].toString()),
      ),
      body: Column(
        children: <Widget>[
         Container(
           child: Center(child: Infoset(districtData:myDistrictData[index] ,code: 3,)),
         ),

          Container(
            child: Center(
              child: toggle
                  ? PieChart(
                      dataMap: dataMap,
                      animationDuration: Duration(milliseconds: 800),
                      chartLegendSpacing: 32.0,
                      chartRadius: MediaQuery.of(context).size.width / 2.7,
                      showChartValuesInPercentage: true,
                      showChartValues: true,
                      showChartValuesOutside: false,
                      chartValueBackgroundColor: Colors.grey[200],
                      colorList: colorList,
                      showLegends: true,
                      legendPosition: LegendPosition.right,
                      decimalPlaces: 1,
                      showChartValueLabel: true,
                      initialAngle: 0,
                      chartValueStyle: defaultChartValueStyle.copyWith(
                        color: Colors.blueGrey[900].withOpacity(0.9),
                      ),
                      chartType: ChartType.disc,
                    )
                  : Text("Press FAB to show chart"),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: togglePieChart,
        child: Icon(Icons.insert_chart),
      ),
    );
  }

  void togglePieChart() {
    setState(() {
      toggle = !toggle;
    });
  }
}
