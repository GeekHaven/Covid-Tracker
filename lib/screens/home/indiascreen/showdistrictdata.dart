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
      dataMap.putIfAbsent("Deaths",
          () => double.parse((myDistrictData[index]["deaths"]).toString()));
    } else {
      dataMap.putIfAbsent("Deaths",
          () => double.parse((myDistrictData[index]["deceased"]).toString()));
    }
    dataMap.putIfAbsent("Recovered",
        () => double.parse((myDistrictData[index]["recovered"]).toString()));
    dataMap.putIfAbsent("Active",
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
      body: Column(
        children: <Widget>[
          Container(
            child: Center(
                child: (text == "country")
                    ? Infoset(
                        worldData: myDistrictData[index],
                        code: 4,
                      )
                    : Infoset(districtData: myDistrictData[index], code: 3)),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.15),
          Container(
            child: Center(
                child: PieChart(
              dataMap: dataMap,
              animationDuration: Duration(milliseconds: 1500),
              chartLegendSpacing: 42.0,
              chartRadius: MediaQuery.of(context).size.width / 2,
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
            )),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.024),
          Container(
                  //color: Colors.red,
                  padding: EdgeInsets.only(top: 30),
                  child: RichText(
                    text: TextSpan(
                      text: '',
                      style: Theme.of(context).textTheme.headline6.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Stay',
                          style: TextStyle(
                                fontWeight: FontWeight.bold,
                                
                                fontSize: 32)),
                        TextSpan(
                            text: ' Home\n',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.purple[300],
                                fontSize: 42)),
                        TextSpan(
                          text: '                      Stay',
                          style: TextStyle(
                                fontWeight: FontWeight.bold,
                                
                                fontSize: 32)),
                        TextSpan(
                            text: ' Safe.',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.purple[300],
                                fontSize: 42)),
                      ],
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
