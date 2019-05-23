import 'package:flutter/material.dart';
import 'package:customer_tracking/bean/visit_record.dart';

class VisitRecordChange extends StatefulWidget {
  static const routeName = "/VisitRecordChange";

  @override
  VisitRecordChangeState createState() {
    // TODO: implement createState
    return new VisitRecordChangeState();
  }
}

class VisitRecordChangeState extends State<VisitRecordChange> {
  bool isAdd;
  VisitRecord visitRecord;
  GlobalKey<FormState> _globalKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> map = ModalRoute.of(context).settings.arguments;
    isAdd = map["isAdd"];
    if (isAdd) {
      visitRecord = new VisitRecord();
    } else {
      visitRecord = map["visit_record"];
    }

    return Scaffold(
      appBar: AppBar(title: Text(isAdd ? "新增记录" : "修改记录"), centerTitle: true),
      body: _buildBody(isAdd),
      floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.save,
            color: Colors.white,
          ),
          onPressed: () {}),
    );
  }

  Widget _buildBody(bool isAdd) {
    EdgeInsets edgeInsets =
        EdgeInsets.symmetric(vertical: 8.0, horizontal: 2.0);
    return new SingleChildScrollView(
        child: new Form(
            key: _globalKey,
            child: new Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Card(
                  child:
                      Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                    Padding(
                        padding: edgeInsets,
                        child: TextFormField(
                          initialValue: isAdd ? null : visitRecord.visitTitle,
                          decoration: InputDecoration(
                              helperText: "不超过10个字",
                              isDense: true,
                              icon: Icon(
                                Icons.title,
                                color: Colors.blue,
                                size: 24.0,
                              ),
                              border: OutlineInputBorder(),
                              labelText: "拜访摘要"),
                          onSaved: (String value) {
                            visitRecord.visitTitle = value;
                          },
                        )),
                    Padding(
                        padding: edgeInsets,
                        child: TextFormField(
                          initialValue: isAdd ? null : visitRecord.visitStaff,
                          decoration: InputDecoration(
                              isDense: true,
                              icon: Icon(
                                Icons.person,
                                color: Colors.blue,
                                size: 24.0,
                              ),
                              border: OutlineInputBorder(),
                              labelText: "拜访人员"),
                          onSaved: (String value) {
                            visitRecord.visitStaff = value;
                          },
                        )),
                    Padding(
                        padding: edgeInsets,
                        child: TextFormField(
                          initialValue:
                              isAdd ? null : visitRecord.accompaniedStaff,
                          decoration: InputDecoration(
                              isDense: true,
                              icon: Icon(
                                Icons.people,
                                color: Colors.blue,
                                size: 24.0,
                              ),
                              border: OutlineInputBorder(),
                              labelText: "陪同人员"),
                          onSaved: (String value) {},
                        )),
                    Padding(
                        padding: edgeInsets,
                        child: TextFormField(
                          initialValue: isAdd ? null : visitRecord.visitMethod,
                          decoration: InputDecoration(
                              isDense: true,
                              icon: Icon(Icons.category,
                                  color: Colors.blue, size: 24.0),
                              border: OutlineInputBorder(),
                              labelText: "拜访形式"),
                          onSaved: (String value) {},
                        )),
                    Padding(
                        padding: edgeInsets,
                        child: TextFormField(
                          initialValue: isAdd ? null : visitRecord.dateTime,
                          decoration: InputDecoration(
                              isDense: true,
                              icon: Icon(Icons.date_range,
                                  color: Colors.blue, size: 24.0),
                              border: OutlineInputBorder(),
                              labelText: "拜访日期"),
                          onSaved: (String value) {},
                        )),
                  ]),
                  margin: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 15.0),
                ),
                Card(
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      new ListTile(title: new Text("拜访内容: ")),
                      Container(
                          padding: EdgeInsets.fromLTRB(16.0, 0.0, 10.0, 36.0),
                          child: new TextFormField(
                            maxLines: null,
                            initialValue:
                                isAdd ? null : visitRecord.visitContent,
                            onSaved: (String value) {
                              visitRecord.note = value;
                            },
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
                        title: new Text("拜访照片/视频",textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16.0)),
                      ),
                      new Container(
                        margin: EdgeInsets.fromLTRB(4.0, 4.0, 4.0, 10.0),
                        child: new Wrap(
                          spacing: 8.0,
                          runSpacing: 6.0,
                          children: _buildPictureList(
                              visitRecord.visitPicture, visitRecord.visitVideo),
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
                            child: new TextFormField(
                              maxLines: null,
                              initialValue: isAdd ? null : visitRecord.note,
                              onSaved: (String value) {
                                visitRecord.note = value;
                              },
                            ))
                      ],
                    ),
                    margin: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0))
              ],
            )));
  }

  List<Widget> _buildPictureList(List<String> pictures, List<String> video) {
    List<Widget> result = [];
    if (pictures != null) {
      for (String url_picture in pictures) {
        result.add(Stack(
          children: <Widget>[
            new Container(
              height: 150.0,
              width: 150.0,
              child: new FadeInImage.assetNetwork(
                  placeholder: "images/loading.gif",
                  image: url_picture,
                  fit: BoxFit.cover),
            ),
            Positioned(
                top: 0.0,
                right: 0.0,
                child: InkWell(
                    child: IconButton(
                        icon: Icon(Icons.cancel),
                        color: Colors.blue,
                        onPressed: () {})))
          ],
        ));
      }
    }

    if (video != null) {
      for (String video_url in video) {
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
                onPressed: () {}),
            Positioned(
                top: 0.0,
                right: 0.0,
                child: IconButton(
                    icon: Icon(Icons.cancel),
                    color: Colors.blue,
                    onPressed: () {}))
          ],
        ));
      }
    }

    result.add(new Container(
        height: 150.0,
        width: 150.0,
        color: Colors.blue[50],
        child: IconButton(
            icon: Icon(Icons.camera_alt),
            color: Colors.grey,
            iconSize: 140.0,
            onPressed: () {})));
    return result;
  }
}
