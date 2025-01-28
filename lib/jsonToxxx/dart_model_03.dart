class DartModel03 {
  int? code;
  Map<String, dynamic>? data;
  int? ibfilecount;

  DartModel03({this.code, this.data, this.ibfilecount});

  DartModel03.fromJson(Map<String, dynamic> json) {
    code = json["code"];
    data = {};
    data?["code"] = json["data"]["code"];
    data?["requestParams"] = json["data"]["requestParams"];
    ibfilecount = json["ibfilecount"];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json["code"] = code;
    json["data"]["code"] = data?["code"];
    json["data"]["requestParams"] = data?["requestParams"];
    json["ibfilecount"] = ibfilecount;
    return json;
  }
}
