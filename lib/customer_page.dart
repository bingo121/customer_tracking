import 'package:customer_tracking/bean/customer.dart';
import 'package:flutter/material.dart';
import 'package:customer_tracking/bean/visit_record.dart';
import 'package:customer_tracking/visitRecord_Detail.dart';
import 'package:customer_tracking/customer_change.dart';

class CustomerPage extends StatefulWidget {
  static const routeName = "/CustomerPage";

  @override
  CustomerPageState createState() {
    return new CustomerPageState();
  }
}

class CustomerPageState extends State<CustomerPage> {
  int userId;
  Customer customer;
  List<VisitRecord> visitRecordList;
  bool isAttention = false;

  final List<Tab> customerTabs = <Tab>[Tab(text: "客户信息"), Tab(text: "拜访记录")];

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> map = ModalRoute.of(context).settings.arguments;
    userId = map["userId"] as int;
    customer = map["customer"] as Customer;
    visitRecordList = List.generate(5, (index) {
      return VisitRecord.fromList(index + customer.customerId);
    });

    return new DefaultTabController(
        length: customerTabs.length,
        child: new Scaffold(
            appBar: AppBar(
              title: new Text(customer.customerName),
              bottom: TabBar(
                tabs: customerTabs,
              ),
              centerTitle: true,
            ),
            body:
                TabBarView(children: <Widget>[_userDetail(), _visitRecord()])));
  }

  Widget _userDetail() {
    var tileStyle = new TextStyle(color: Colors.grey);
    return new Stack(
      children: <Widget>[
        new SingleChildScrollView(
          child: new Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Card(
                child: new Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      new ListTile(
                          leading: new Text("姓名", style: tileStyle),
                          title: new Text(customer.customerName)),
                      new Divider(height: 0.0),
                      new ListTile(
                          leading: new Text("联系人", style: tileStyle),
                          title: new Text(customer.contact_person)),
                      new Divider(height: 0.0),
                      new ListTile(
                        leading: new Text("地址", style: tileStyle),
                        title: new Text(customer.address),
                      ),
                      new Divider(height: 0.0),
                      new ListTile(
                        leading: new Text("电话", style: tileStyle),
                        title: new Text(customer.phone),
                      )
                    ]),
                margin: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 15.0),
              ),
              Card(
                child: new Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      new ListTile(
                        leading: new Text("人员规模", style: tileStyle),
                        title: new Text(customer.staff_size),
                      ),
                      new Divider(height: 0.0),
                      new ListTile(
                        leading: new Text("风险等级", style: tileStyle),
                        title: new Text(customer.risk_level),
                      ),
                      new Divider(height: 0.0),
                      new ListTile(
                          leading: new Text(
                            "客户等级",
                            style: tileStyle,
                          ),
                          title: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: List<Widget>.generate(
                                  customer.inportant_level,
                                  (i) => Icon(Icons.star,
                                      color: Colors.orange, size: 15.0)))),
                      new Divider(height: 0.0),
                      new ListTile(
                        leading: new Text("建档日期", style: tileStyle),
                        title: new Text(customer.dateTime),
                      ),
                    ]),
                margin: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 15.0),
              ),
              Card(
                child: new Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    new ListTile(
                        title: new Text("客户照片",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16.0)),
                        trailing: IconButton(
                            icon: Icon(Icons.arrow_forward_ios),
                            onPressed: null)),
                    new Container(
                      padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 15.0),
                      child: new FadeInImage.assetNetwork(
                          placeholder: "images/loading.gif",
                          image: customer.customer_pictures[0],
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
                            customer.note,
                            maxLines: 10,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.start,
                          ))
                    ],
                  ),
                  margin: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0))
            ],
          ),
        ),
        new Positioned(
            right: 20.0,
            bottom: 20.0,
            child: new Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                new Container(
                  child: IconButton(
                      icon: isAttention
                          ? Icon(Icons.star, color: Colors.red[600], size: 36.0)
                          : Icon(Icons.star_border, color: Colors.blue, size: 36.0),
                      onPressed: () {
                        setState(() {
                          isAttention = !isAttention;
                        });
                      }),
                  margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 15.0),
                ),
                new Container(
                  child: IconButton(
                      icon: Icon(Icons.border_color, color: Colors.blue),
                      onPressed: () {
                        Navigator.pushNamed(context, CustomerChange.routeName,
                            arguments: <String, dynamic>{
                              "isAdd": false,
                              "customer": customer
                            });
                      }),
                )
              ],
            ))
      ],
    );
  }

  Widget _visitRecord() {
    final Iterable<ListTile> tiles = visitRecordList.map((visitRecord) {
      return ListTile(
        leading: visitRecord.visitMethod == "电话拜访"
            ? Icon(Icons.phone, color: Colors.blue)
            : Icon(Icons.card_travel, color: Colors.blue),
        title: Text(visitRecord.visitTitle),
        subtitle:Text(visitRecord.dateTime),
        trailing:Text(visitRecord.visitStaff),
        onTap: () {
          Navigator.pushNamed(context, VisitRecordPage.routeName,
              arguments: <String, dynamic>{
                "customer_name": customer.customerName,
                "visitRecord": visitRecord
              });
        },
      );
    });

    final List<Widget> divided =
        ListTile.divideTiles(context: context, tiles: tiles).toList();
    return Stack(
      children: <Widget>[
        ListView(children: divided),
        new Positioned(
            right: 20.0,
            bottom: 20.0,
            child: IconButton(
                iconSize: 36.0,
                icon: Icon(Icons.add, color: Colors.blue),
                onPressed: () {}))
      ],
    );
  }
}
