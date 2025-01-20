class DartModel02 {
  int? code;
  String? msg;
  int? ibfilecount;

  DartModel02({this.code, this.msg, this.ibfilecount});

  DartModel02.fromJson(Map<String, dynamic> json) {
    code = json["code"];
    msg = json["msg"];
    ibfilecount = json["ibfilecount"];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json["code"] = code;
    json["msg"] = msg;
    json["ibfilecount"] = ibfilecount;
    return json;
  }
}
