import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import '../home_widgets/infoCardset.dart';

class ShowDistrictData extends StatefulWidget {
  var districtData;
  var index;
  var text;
  ShowDistrictData({this.districtData, this.index, this.text});
  @override
  _ShowDistrictDataState createState() => _ShowDistrictDataState();
}

class _ShowDistrictDataState extends State<ShowDistrictData> {
  var myDistrictData;
  var index;
  var text;
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
    text = widget.text;
    if (text == "country") {
      dataMap.putIfAbsent("Total No of Deaths",
          () => double.parse((myDistrictData[index]["deaths"]).toString()));
    } else {
      dataMap.putIfAbsent("Total No of Deaths", 
          () => double.parse((myDistrictData[index]["deceased"]).toString()));
    }
    dataMap.putIfAbsent("Total No of Recovered cases",
        () => double.parse((myDistrictData[index]["recovered"]).toString()));
    dataMap.putIfAbsent("Total No of Active cases",
        () => double.parse((myDistrictData[index]["active"]).toString()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: (text == "country")
            ? Text(myDistrictData[index]["country"].toString())
            : Text(myDistrictData[index]["district"].toString()),
      ),
      body: ListView(
              children: <Widget>[Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 30, left:15, right:10, bottom:10),
              child: Center(
                  child: (text == "country")
                      ? Infoset(
                          worldData: myDistrictData[index],
                          code: 4,
                        )
                      : Infoset(districtData: myDistrictData[index], code: 3)),
            ),
            SizedBox(
                height: (MediaQuery.of(context).size.height -
                        MediaQuery.of(context).padding.top) *
                    0.01),
            Container(
              child: Center(
                  child: PieChart(
                dataMap: dataMap,
                animationDuration: Duration(milliseconds: 1500),
                chartLegendSpacing: ( MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top ) * 0.07,
                chartRadius: MediaQuery.of(context).size.width / 1.7,
                showChartValuesInPercentage: true,
                showChartValues: true,
                showChartValuesOutside: false,
                chartValueBackgroundColor: Colors.grey[200],
                colorList: colorList,
                showLegends: true,
                legendPosition: LegendPosition.bottom,
                decimalPlaces: 1,
                showChartValueLabel: true,
                initialAngle: 0,
                chartValueStyle: defaultChartValueStyle.copyWith(
                  color: Colors.blueGrey[900].withOpacity(0.9),
                ),
                chartType: ChartType.disc,
              )),
            ),
          ],
        ),]
      ),
    );
  }
}
