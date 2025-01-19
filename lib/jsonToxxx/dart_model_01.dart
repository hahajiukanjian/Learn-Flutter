class DartModel01 {
  int? code;
  String? msg;
  int? ibfilecount;

  DartModel01({this.code, this.msg, this.ibfilecount});

  DartModel01.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    msg = json['data']['msg'];
    ibfilecount = json['data']['IBFileConvertCount'];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['code'] = code;
    json['data']['msg'] = msg;
    json['data']['IBFileConvertCount'] = ibfilecount;
    return json;
  }
}
