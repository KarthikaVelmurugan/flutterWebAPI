import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'service.dart';
import 'service.api.dart';
void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home:HomePage(),
  ));
}
class HomePage extends StatefulWidget{
  HomePage() : super();
  @override
  _HomePage createState() => _HomePage();
}
class _HomePage extends State<HomePage>{
  List<Service> details;
  final _headStyle = TextStyle(
    fontFamily: 'Aerial',
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color:Colors.black
  );
  final _subheadStyle = TextStyle(
    fontWeight: FontWeight.w300,
    color: Colors.deepPurple,
    fontSize: 12,
    fontFamily: 'Aerial'

  );
  @override
  void initState() {
    super.initState();
    details = [];
    getdata();
  }

  getdata() {
    ServiceApi.getDetails().then((value) {
      setState(() {
        details = value;
      });
      print("${details.length}");
    });
  }

  SingleChildScrollView dataTable() {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: DataTable(
        columns: [
          DataColumn(label:Text("Sl.no.",style:_headStyle,)),
          DataColumn(label:Text("Roll.no.",style:_headStyle,)),
          DataColumn(label:Text("Name",style:_headStyle,)),
          DataColumn(label:Text("Branch",style:_headStyle,)),
          DataColumn(label:Text("Batch",style:_headStyle,)),
          DataColumn(label:Text("Duemonth",style:_headStyle,)),
          DataColumn(label:Text("Dueyear",style:_headStyle,)),
          DataColumn(label:Text("Status",style:_headStyle,)),
        ],
        rows: details.map((e) => DataRow(
          cells: [
            DataCell(Text(e.slno.toString(),style: _subheadStyle,)),
            DataCell(Text(e.rollno,style: _subheadStyle,)),
            DataCell(Text(e.name,style: _subheadStyle,)),
            DataCell(Text(e.branch,style: _subheadStyle,)),
            DataCell(Text(e.batch,style: _subheadStyle,)),
            DataCell(Text(e.lastduemonth,style: _subheadStyle,)),
            DataCell(Text(e.lastdueyear,style: _subheadStyle,)),
            DataCell(Text(e.status,style: _subheadStyle,)),
          ]
        )).toList(),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        child:dataTable(),
      ),
    );
  }
}