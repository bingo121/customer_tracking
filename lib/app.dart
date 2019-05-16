import 'package:customer_tracking/bean/user.dart';
import 'package:flutter/material.dart';
import 'package:customer_tracking/bean/customer.dart';
import 'package:customer_tracking/customer_page.dart';
import 'package:customer_tracking/customer_change.dart';

class AppPage extends StatefulWidget {
  static const routeName = '/appPage';

  @override
  AppState createState() {
    // TODO: implement createState
    return new AppState();
  }
}

class AppState extends State<AppPage> {
  GlobalKey<ScaffoldState> Key = new GlobalKey<ScaffoldState>();
  User user;
  List<Customer> customers = List.generate(50, (i) => Customer.fromList(i));
  Set<Customer> attentions = new Set<Customer>();

  final List<Tab> appTabs = <Tab>[Tab(text: "客户一览"), Tab(text: "关注的客户")];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    user = ModalRoute.of(context).settings.arguments;
    return new DefaultTabController(
        length: appTabs.length,
        child: new Scaffold(
          key: Key,
          appBar: AppBar(
            title: Text("客户"),
            bottom: TabBar(tabs: appTabs),
            centerTitle: true,
          ),
          drawer: _myDrawer(),
          body: TabBarView(children: <Widget>[_usersList(), _attentionList()]),
          floatingActionButton: FloatingActionButton(
              backgroundColor: Colors.blue,
              child: Icon(
                Icons.add,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.pushNamed(context,CustomerChange.routeName,arguments: <String,dynamic>{
                  "isAdd":true
                });
              }),
        ));
  }

  Widget _myDrawer() {
    return new Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: new Text(user.name),
            accountEmail: new Text(user.email),
            currentAccountPicture: new CircleAvatar(
              backgroundImage: new AssetImage('images/head.jpg'),
            ),
          ),
          ListTile(
            leading: new Icon(Icons.add),
            title: new Text("添加账户"),
            onTap: () {
              Key.currentState
                ..removeCurrentSnackBar()
                ..showSnackBar(new SnackBar(content: new Text("你点击了添加账户")));
            },
          ),
          ListTile(
            leading: new Icon(Icons.settings),
            title: new Text("管理账户"),
          ),
          ListTile(
            leading: new Icon(Icons.power_settings_new),
            title: new Text("注销"),
          )
        ],
      ),
    );
  }

  Widget _usersList() {
    return ListView.builder(
        padding: const EdgeInsets.all(14.0),
        itemCount: customers.length * 2,
        itemBuilder: (context, i) {
          if (i.isOdd) return Divider(height: 0.0);
          final index = i ~/ 2;
          return _buildTile(customers[index]);
        });
  }

  Widget _attentionList() {
    attentions.add(customers[4]);
    attentions.add(customers[9]);

    final Iterable<ListTile> tiles = attentions.map(_buildTile);
    final List<Widget> divided =
        ListTile.divideTiles(context: context, tiles: tiles).toList();
    return new ListView(
      children: divided,
    );
  }

  ListTile _buildTile(Customer customer) {
    var stars = Row(
      mainAxisSize: MainAxisSize.min,
      children: List<Widget>.generate(customer.inportant_level,
          (i) => Icon(Icons.star, color: Colors.orange, size: 15.0)),
    );
    return ListTile(
      leading: Icon(Icons.perm_contact_calendar, color: Colors.blue),
      title: new Text(customer.customerName, style: TextStyle(fontSize: 16.0)),
      trailing: stars,
      onTap: () {
        Navigator.pushNamed(context, CustomerPage.routeName,
            arguments: <String, dynamic>{
              "userId": user.userId,
              "customer": customer
            });
      },
    );
  }
}
