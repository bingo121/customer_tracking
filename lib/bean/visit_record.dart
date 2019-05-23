class VisitRecord {
  int _visitRecordId;
  String _visitTitle;
  String _visitStaff;
  String _accompaniedStaff;
  String _dateTime;
  String _visitMethod;
  String _visitContent;
  String _note;
  List<String> _visitPicture;
  List<String> _visitVideo;


  VisitRecord();

  VisitRecord.fromList(int i) {
    visitRecordId = i;
    visitTitle = "拜访摘要 " + i.toString();
    visitStaff = "职员 " + i.toString();
    accompaniedStaff = "陪同职员 " + i.toString();
    dateTime = DateTime.now().toString().substring(0,19);
    visitMethod = i % 2 == 0 ? "电话拜访" : "登门拜访";
    visitContent = "Flutter是谷歌的移动UI框架，可以快速在iOS和Android上构建高质量的原生用户界面。 Flutter可以与现有的代码一起工作。在全世界，Flutter正在被越来越多的开发者和组织使用，并且Flutter是完全免费、开源的。拜访内容 " + i.toString();
    _note = "备注 " + i.toString();
    visitPicture = List<String>.generate(i%4+1, (index) {
      return "http://111.231.1.131:80/images/baifang" +
          ((i + index) % 10).toString() +
          ".jpg";
    });
    visitVideo = ["http://111.231.1.131:80/images/video01.mp4,http://111.231.1.131:80/images/video01_cover.jpg","http://111.231.1.131:80/images/video02.mp4,http://111.231.1.131:80/images/video02_cover.jpg"];
  }

  List<String> get visitPicture => _visitPicture;

  set visitPicture(List<String> value) {
    _visitPicture = value;
  }

  List<String> get visitVideo => _visitVideo;

  set visitVideo(List<String> value) {
    _visitVideo = value;
  }

  String get note => _note;

  set note(String value) {
    _note = value;
  }

  String get visitContent => _visitContent;

  set visitContent(String value) {
    _visitContent = value;
  }

  String get visitMethod => _visitMethod;

  set visitMethod(String value) {
    _visitMethod = value;
  }

  String get dateTime => _dateTime;

  set dateTime(String value) {
    _dateTime = value;
  }

  String get accompaniedStaff => _accompaniedStaff;

  set accompaniedStaff(String value) {
    _accompaniedStaff = value;
  }

  String get visitStaff => _visitStaff;

  set visitStaff(String value) {
    _visitStaff = value;
  }

  int get visitRecordId => _visitRecordId;

  set visitRecordId(int value) {
    _visitRecordId = value;
  }

  String get visitTitle => _visitTitle;

  set visitTitle(String value) {
    _visitTitle = value;
  }
}
