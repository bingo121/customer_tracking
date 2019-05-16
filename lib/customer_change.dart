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

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> map = ModalRoute.of(context).settings.arguments;
    isAdd = map["isAdd"];
    if (isAdd) {
      customer = map["customer"];
    } else {
      customer = new Customer();
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
    return new SingleChildScrollView(
        child: new Form(
            key: _globalKey,
            child: new Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Card(
                  child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Padding(padding: EdgeInsets.symmetric(vertical: 5.0,horizontal: 5.0),child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Container(margin: EdgeInsets.fromLTRB(0.0, 0.0, 5.0,0.0),child: Icon(Icons.person,color: Colors.blue)),
                            TextFormField()
                          ],
                        ),)

                  ]),
                  margin: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 15.0),
                ),
                Card(
                  child: null,
                ),
                Card(
                  child: null,
                ),
                Card(
                  child: null,
                )
              ],
            )));
  }
}
