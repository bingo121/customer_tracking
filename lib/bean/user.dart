class User{

  int _userId;
  String _name;
  String _password;
  String _email;
  String _token;


  User(this._userId, this._name, this._password, this._email, this._token);

  int get userId => _userId;

  set userId(int value) {
    _userId = value;
  }

  String get name => _name;

  String get token => _token;

  set token(String value) {
    _token = value;
  }

  String get email => _email;

  set email(String value) {
    _email = value;
  }

  String get password => _password;

  set password(String value) {
    _password = value;
  }

  set name(String value) {
    _name = value;
  }


}