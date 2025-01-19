class Data {
  int? code;
  String? msg;
  int? ibfilecount;
  Data({this.code, this.msg, this.ibfilecount});

  Data.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    msg = json['data']['msg'];
    ibfilecount = json['data']['IBFileConvertFileCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['data']['msg'] = msg;
    data['data']['IBFileConvertFileCount'] = ibfilecount;
    return data;
  }
}
