import 'package:flutter/material.dart';
import 'package:customer_tracking/bean/visit_record.dart';

class VisitRecordPage extends StatefulWidget {
  static const routeName = "/VisitRecordPage";

  @override
  VisitRageState createState() {
    // TODO: implement createState
    return new VisitRageState();
  }
}

class VisitRageState extends State<VisitRecordPage> {
  VisitRecord visitRecord;
  String custormer_name;

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> map = ModalRoute.of(context).settings.arguments;
    custormer_name = map["customer_name"];
    visitRecord = map["visitRecord"];

    return Scaffold(
      appBar: AppBar(
        title: Text(custormer_name),
        centerTitle: true,
      ),
      body: _visitRecord_Detail(),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.border_color, color: Colors.white),
          onPressed: () {}),
    );
  }

  Widget _visitRecord_Detail() {
    var tileStyle = new TextStyle(color: Colors.grey);
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Card(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                new ListTile(
                    leading: Text("拜访摘要", style: tileStyle),
                    title: Text(visitRecord.visitTitle)),
                new Divider(height: 0.0),
                new ListTile(
                    leading: Text("拜访人员", style: tileStyle),
                    title: Text(visitRecord.visitStaff)),
                new Divider(height: 0.0),
                new ListTile(
                    leading: Text("陪同人员", style: tileStyle),
                    title: Text(visitRecord.accompaniedStaff)),
                new Divider(height: 0.0),
                new ListTile(
                    leading: Text(
                      "拜访形式",
                      style: tileStyle,
                    ),
                    title: Text(visitRecord.visitMethod)),
                new Divider(height: 0.0),
                new ListTile(
                    leading: Text("拜访日期", style: tileStyle),
                    title: Text(visitRecord.dateTime))
              ],
            ),
            margin: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 15.0),
          ),
          Card(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new ListTile(title: new Text("拜访内容: ")),
                Container(
                    padding: EdgeInsets.fromLTRB(16.0, 0.0, 5.0, 36.0),
                    child: new Text(
                      visitRecord.visitContent,
                      maxLines: 15,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.start,
                    ))
              ],
            ),
            margin: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 15.0),
          ),
          Card(
            child: new Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                new ListTile(
                    title: new Text("拜访照片",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16.0)),
                    trailing: IconButton(
                        icon: Icon(Icons.arrow_forward_ios), onPressed: null)),
                new Container(
                  padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 15.0),
                  child: new FadeInImage.assetNetwork(
                      placeholder: "images/loading.gif",
                      image: visitRecord.visitPicture[0],
                      fit: BoxFit.cover),
                )
              ],
            ),
            margin: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 15.0),
          ),
          Card(
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  new ListTile(title: new Text("备注: ")),
                  Container(
                      padding: EdgeInsets.fromLTRB(16.0, 0.0, 10.0, 36.0),
                      child: new Text(
                        visitRecord.note,
                        maxLines: 15,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.start,
                      ))
                ],
              ),
              margin: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0))
        ],
      ),
    );
  }
}
