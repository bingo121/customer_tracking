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
    customer_pictures =<String>["http://111.231.1.131:80/images/person"+(i%10).toString()+".jpg"];
    dateTime = DateTime.now().toString().substring(0,19);
    note = "是明确一体化在线平台建设管理的推进机制。国务院办公厅负责牵头推进国家政务服务平台建设，推动建设一体化在线平台标准规范体系、安全保障体系和运营管理体系；省、自治区、直辖市人民政府和国务院有关部门负责本地区、本部门政务服务平台建设、安全保障和运营管理 备注 "+i.toString();
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