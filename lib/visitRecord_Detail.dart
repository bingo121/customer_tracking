import 'package:flutter/material.dart';
import 'package:customer_tracking/bean/visit_record.dart';
import 'package:customer_tracking/visitRecord_change.dart';

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
          onPressed: () {
            Navigator.pushNamed(context, VisitRecordChange.routeName,
                arguments: <String, dynamic>{
                  "isAdd": false,
                  "visit_record": visitRecord
                });
          }),
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
                    title: new Text("拜访照片/视频",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16.0))),
                new Container(
                  margin: EdgeInsets.fromLTRB(4.0, 4.0, 4.0, 10.0),
                  child: new Wrap(
                    spacing: 8.0,
                    runSpacing: 6.0,
                    children: buildPictureList(),
                  ),
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

  List<Widget> buildPictureList() {
    List<Widget> result;

    result = visitRecord.visitPicture.map<Widget>((url) {
      return new Container(
        height: 150.0,
        width: 150.0,
        child: new FadeInImage.assetNetwork(
            placeholder: "images/loading.gif", image: url, fit: BoxFit.cover),
      );
    }).toList();

    for (String video_url in visitRecord.visitVideo) {
      result.add(Stack(
        alignment: AlignmentDirectional.center,
        children: <Widget>[
          new Container(
            height: 150.0,
            width: 150.0,
            child: new FadeInImage.assetNetwork(
                placeholder: "images/loading.gif",
                image: video_url.split(",")[1],
                fit: BoxFit.cover),
          ),
          IconButton(
              iconSize: 60.0,
              icon: Icon(Icons.play_circle_outline),
              color: Colors.blue,
              onPressed: () {})
        ],
      ));
    }
    return result;
  }
}
