
class Customer {
  int _customerId;
  String _customerName;
  String  _contact_person;
  String _address;
  String _phone;
  int _inportant_level;
  String _risk_level;
  String _staff_size;
  List<String> _customer_pictures;
  String _dateTime;
  String _note;


  Customer();

  Customer.fromList(int i){
    customerId=i;
    customerName="客户 "+i.toString();
    contact_person = "联系人 "+i.toString();
    address = "地址 "+i.toString();
    phone = "联系电话 "+i.toString();
    inportant_level = i%5+1;
    risk_level = "中";
    staff_size = "1"+i.toString()+"人";
    customer_pictures = List<String>.generate(i%4+1, (index) {
      return "http://111.231.1.131:80/images/person" +
          ((i + index) % 10).toString() +
          ".jpg";
    });
    dateTime = DateTime.now().toString().substring(0,19);
    note = "Flutter是谷歌的移动UI框架，可以快速在iOS和Android上构建高质量的原生用户界面。 Flutter可以与现有的代码一起工作。在全世界，Flutter正在被越来越多的开发者和组织使用，并且Flutter是完全免费、开源的。 备注 "+i.toString();
  }

  String get note => _note;

  set note(String value) {
    _note = value;
  }
  List<String> get customer_pictures => _customer_pictures;

  set customer_pictures(List<String> value) {
    _customer_pictures = value;
  }

  String get dateTime => _dateTime;

  set dateTime(String value) {
    _dateTime = value;
  }

  String get staff_size => _staff_size;

  set staff_size(String value) {
    _staff_size = value;
  }

  String get risk_level => _risk_level;

  set risk_level(String value) {
    _risk_level = value;
  }

  int get inportant_level => _inportant_level;

  set inportant_level(int value) {
    _inportant_level = value;
  }

  String get phone => _phone;

  set phone(String value) {
    _phone = value;
  }

  String get address => _address;

  set address(String value) {
    _address = value;
  }

  String get contact_person => _contact_person;

  set contact_person(String value) {
    _contact_person = value;
  }

  String get customerName => _customerName;

  set customerName(String value) {
    _customerName = value;
  }

  int get customerId => _customerId;

  set customerId(int value) {
    _customerId = value;
  }


}