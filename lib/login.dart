import 'package:customer_tracking/bean/user.dart';
import 'package:flutter/material.dart';
import 'package:customer_tracking/app.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() {
    return new _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<FormState> loginKey = new GlobalKey<FormState>();
  GlobalKey<ScaffoldState> snackbarKey = new GlobalKey<ScaffoldState>();

  String userName;
  String password;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      key: snackbarKey,
      appBar: new AppBar(
        title: new Text("登录"),
        centerTitle: true,
      ),
      body: new SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            new Container(
              padding: const EdgeInsets.all(16.0),
              margin: EdgeInsets.fromLTRB(0.0, 25.0, 0.0, 10.0),
              child: new Form(
                  key: loginKey,
                  child: new Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      new TextFormField(
                        decoration: new InputDecoration(
                            labelText: "用户名",
                            icon: Icon(
                              Icons.person,
                              color: Colors.blue,
                            )),
                        validator: (value) {
                          return value.length == 0 ? "用户名不能为空" : null;
                        },
                        onSaved: (value) {
                          userName = value;
                        },
                      ),
                      new TextFormField(
                        decoration: new InputDecoration(
                            labelText: "密码",
                            icon: Icon(
                              Icons.lock,
                              color: Colors.blue,
                            )),
                        obscureText: true,
                        validator: (value) {
                          return value.length < 6 ? "密码长度不到6位" : null;
                        },
                        onSaved: (value) {
                          password = value;
                        },
                      ),
                    ],
                  )),
            ),
            new Container(
              height: 82.0,
              padding: new EdgeInsets.all(16.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  new RaisedButton(
                    child: new Text(
                      "注册",
                      style: TextStyle(fontSize: 18.0, color: Colors.white),
                    ),
                    onPressed: register,
                    color: Colors.blue,
                  ),
                  new RaisedButton(
                      child: new Text(
                        "登录",
                        style: TextStyle(fontSize: 18.0, color: Colors.white),
                      ),
                      onPressed: login,
                      color: Colors.blue)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void login() {
    var loginForm = loginKey.currentState;
    if (loginForm.validate()) {
      loginForm.save();
      if (userName == "sxbingo" && password == "1234567") {
        User user = new User(1, userName, password, userName + '@qq.com',
            'dda67s5f7as7d65fa86f679sd9xs67');
        Navigator.pushNamed(context, AppPage.routeName, arguments: user);
      }else{
        snackbarKey.currentState.removeCurrentSnackBar();
        snackbarKey.currentState.showSnackBar(SnackBar(content: Text("该用户不存在！",textAlign: TextAlign.center)));
      }
    }
  }

  void register() {}
}
