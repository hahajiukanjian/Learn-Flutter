// {"code":0,"data":{"code":0,"method":"GET","requestPrams":"11"},"msg":"SUCCESS."}

class DataModel {
  int? code;
  Map<String, dynamic>? data;
  String? msg;

  DataModel({this.code, this.data, this.msg});

  DataModel.fromJson(Map<String, dynamic> json) {
    code = json["code"];
    data = {};
    data?["method"] = json["data"]["method"];
    data?["requestPrams"] = json["data"]["requestPrams"];
    msg = json["msg"];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json["code"] = code;
    json["data"]["method"] = data?["method"];
    json["data"]["requestPrams"] = data?["requestPrams"];
    json["msg"] = msg;
    return json;
  }
}
