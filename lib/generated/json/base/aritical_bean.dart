/// code : 200
/// message : "成功!"
/// result : [{"path":"https://www.163.com/dy/article/G1O1Q9Q2053469M5.html","image":"http://cms-bucket.ws.126.net/2021/0201/9860dbd3p00qntxlo00iqc000s600e3c.pngimageView&thumbnail=140y88&quality=85","title":"警方通报＂19岁女大学生学车后失联＂:已遇害 全力侦办","passtime":"2021-02-02 10:00:51"}]

class AriticalBean {
  AriticalBean({
      int code, 
      String message, 
      List<Result> result,}){
    _code = code;
    _message = message;
    _result = result;
}

  AriticalBean.fromJson(dynamic json) {
    _code = json['code'];
    _message = json['message'];
    if (json['result'] != null) {
      _result = [];
      json['result'].forEach((v) {
        _result.add(Result.fromJson(v));
      });
    }
  }
  int _code;
  String _message;
  List<Result> _result;

  int get code => _code;
  String get message => _message;
  List<Result> get result => _result;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = _code;
    map['message'] = _message;
    if (_result != null) {
      map['result'] = _result.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// path : "https://www.163.com/dy/article/G1O1Q9Q2053469M5.html"
/// image : "http://cms-bucket.ws.126.net/2021/0201/9860dbd3p00qntxlo00iqc000s600e3c.pngimageView&thumbnail=140y88&quality=85"
/// title : "警方通报＂19岁女大学生学车后失联＂:已遇害 全力侦办"
/// passtime : "2021-02-02 10:00:51"

class Result {
  Result({
      String path, 
      String image, 
      String title, 
      String passtime,}){
    _path = path;
    _image = image;
    _title = title;
    _passtime = passtime;
}

  Result.fromJson(dynamic json) {
    _path = json['path'];
    _image = json['image'];
    _title = json['title'];
    _passtime = json['passtime'];
  }
  String _path;
  String _image;
  String _title;
  String _passtime;

  String get path => _path;
  String get image => _image;
  String get title => _title;
  String get passtime => _passtime;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['path'] = _path;
    map['image'] = _image;
    map['title'] = _title;
    map['passtime'] = _passtime;
    return map;
  }

}