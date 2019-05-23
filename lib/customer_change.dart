import 'package:flutter/material.dart';
import 'package:customer_tracking/bean/customer.dart';

class CustomerChange extends StatefulWidget {
  static const routeName = "/CustomerChange";

  @override
  CustomerChangeState createState() {
    // TODO: implement createState
    return new CustomerChangeState();
  }
}

class CustomerChangeState extends State<CustomerChange> {
  bool isAdd;
  Customer customer;
  GlobalKey<FormState> _globalKey = new GlobalKey<FormState>();

  int importantLevel;
  String riskLevel;

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> map = ModalRoute.of(context).settings.arguments;
    isAdd = map["isAdd"];
    if (isAdd) {
      customer = new Customer();
    } else {
      customer = map["customer"];
      if (importantLevel == null && riskLevel == null) {
        importantLevel = customer.inportant_level;
        riskLevel = customer.risk_level;
      }
    }

    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(title: Text(isAdd ? "新增客户" : "修改客户"), centerTitle: true),
      body: _buildBody(isAdd),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.save, color: Colors.white), onPressed: () {}),
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
                          initialValue: isAdd ? null : customer.customerName,
                          decoration: InputDecoration(
                              isDense: true,
                              icon: Icon(
                                Icons.person,
                                color: Colors.blue,
                                size: 24.0,
                              ),
                              border: OutlineInputBorder(),
                              labelText: "姓名"),
                          onSaved: (String value) {
                            customer.customerName = value;
                          },
                        )),
                    Padding(
                        padding: edgeInsets,
                        child: TextFormField(
                          initialValue: isAdd ? null : customer.contact_person,
                          decoration: InputDecoration(
                              isDense: true,
                              icon: Icon(
                                Icons.account_box,
                                color: Colors.blue,
                                size: 24.0,
                              ),
                              border: OutlineInputBorder(),
                              labelText: "联系人"),
                          onSaved: (String value) {
                            customer.contact_person = value;
                          },
                        )),
                    Padding(
                        padding: edgeInsets,
                        child: TextFormField(
                          initialValue: isAdd ? null : customer.address,
                          decoration: InputDecoration(
                              isDense: true,
                              icon: Icon(
                                Icons.add_location,
                                color: Colors.blue,
                                size: 24.0,
                              ),
                              border: OutlineInputBorder(),
                              labelText: "地址"),
                          onSaved: (String value) {},
                        )),
                    Padding(
                        padding: edgeInsets,
                        child: TextFormField(
                          initialValue: isAdd ? null : customer.phone,
                          decoration: InputDecoration(
                              isDense: true,
                              icon: Icon(Icons.phone,
                                  color: Colors.blue, size: 24.0),
                              border: OutlineInputBorder(),
                              labelText: "电话"),
                          onSaved: (String value) {},
                        )),
                  ]),
                  margin: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 15.0),
                ),
                Card(
                  child:
                      Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                    Padding(
                        padding: edgeInsets,
                        child: TextFormField(
                          initialValue: isAdd ? null : customer.staff_size,
                          decoration: InputDecoration(
                              isDense: true,
                              icon: Icon(
                                Icons.group,
                                color: Colors.blue,
                                size: 24.0,
                              ),
                              border: OutlineInputBorder(),
                              labelText: "雇员规模"),
                          onSaved: (String value) {},
                        )),
                    Padding(
                        padding: edgeInsets,
                        child: DropdownButtonFormField<int>(
                            value: importantLevel,
                            decoration: InputDecoration(
                                isDense: true,
                                icon: Icon(
                                  Icons.local_play,
                                  color: Colors.blue,
                                  size: 24.0,
                                ),
                                border: OutlineInputBorder(),
                                labelText: "重要等级"),
                            onSaved: (int value) {},
                            onChanged: (int newValue) {
                              setState(() {
                                importantLevel = newValue;
                              });
                            },
                            items: <int>[1, 2, 3, 4, 5]
                                .map<DropdownMenuItem<int>>((int value) {
                              return DropdownMenuItem<int>(
                                  value: value,
                                  child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: List<Widget>.generate(
                                          value,
                                          (i) => Icon(Icons.star,
                                              color: Colors.orange,
                                              size: 15.0))));
                            }).toList())),
                    Padding(
                        padding: edgeInsets,
                        child: DropdownButtonFormField<String>(
                            value: riskLevel,
                            decoration: InputDecoration(
                                isDense: true,
                                icon: Icon(
                                  Icons.notification_important,
                                  color: Colors.blue,
                                  size: 24.0,
                                ),
                                border: OutlineInputBorder(),
                                labelText: "风险等级"),
                            onSaved: (String value) {},
                            onChanged: (String newValue) {
                              setState(() {
                                riskLevel = newValue;
                              });
                            },
                            items: <String>["高", "中", "低"]
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                  value: value, child: new Text(value));
                            }).toList())),
                    Padding(
                        padding: edgeInsets,
                        child: TextFormField(
                            enabled: false,
                            initialValue: isAdd
                                ? DateTime.now().toString().substring(0, 19)
                                : customer.dateTime,
                            decoration: InputDecoration(
                                helperText: "由系统生成",
                                isDense: true,
                                icon: Icon(Icons.date_range,
                                    color: Colors.blue, size: 24.0),
                                border: OutlineInputBorder(),
                                labelText: "建档日期"),
                            onSaved: (String value) {
                              customer.dateTime = value;
                            })),
                  ]),
                  margin: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 15.0),
                ),
                Card(
                  child: new Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      new ListTile(
                        title: new Text("客户照片",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16.0)),
                      ),
                      new Container(
                        margin: EdgeInsets.fromLTRB(4.0, 4.0, 4.0, 10.0),
                        child: new Wrap(
                          spacing: 8.0,
                          runSpacing: 6.0,
                          children:
                              _buildPictureList(customer.customer_pictures),
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
                              initialValue: isAdd ? null : customer.note,
                              onSaved: (String value) {
                                customer.note = value;
                              },
                            ))
                      ],
                    ),
                    margin: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0))
              ],
            )));
  }

  List<Widget> _buildPictureList(List<String> pictures) {
    List<Widget> result;
    if (pictures != null) {
      result = pictures.map<Widget>((url) {
        return Stack(
          children: <Widget>[
            new Container(
              height: 150.0,
              width: 150.0,
              child: new FadeInImage.assetNetwork(
                  placeholder: "images/loading.gif",
                  image: url,
                  fit: BoxFit.cover),
            ),

            Positioned(
                top: 0.0,
                right: 0.0,
                child: InkWell(child: IconButton(
                    icon: Icon(Icons.cancel),
                    color: Colors.blue,
                    onPressed: () {})))
          ],
        );
      }).toList();
    } else {
      result = [];
    }

    result.add(new Container(
        height: 150.0,
        width: 150.0,
        color: Colors.blue[50],
        child: IconButton(
            icon: Icon(Icons.camera_alt), color:Colors.grey,iconSize: 140.0, onPressed: () {})));
    return result;
  }
}
