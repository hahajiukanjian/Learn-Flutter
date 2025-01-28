import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:started_flutter/jsonToxxx/dart_model_03.dart';

class JsonToXxx02 extends StatefulWidget {
  const JsonToXxx02({super.key});

  @override
  JsonToXxx02State createState() => JsonToXxx02State();
}

class JsonToXxx02State extends State<JsonToXxx02> {
  var resultMap = '';
  var resultDartModel = '';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: false),
      home: Scaffold(
        appBar: AppBar(title: const Text("Json转Map和DartModel")),
        body: Column(
          children: [
            _jsonToMapBtn(),
            const Text("Json转Map\n", style: TextStyle(fontSize: 20)),
            Text(resultMap),
            _jsonToDartModelBtn(),
            const Text("Json转DartModel\n", style: TextStyle(fontSize: 20)),
            Text(resultDartModel),
          ],
        ),
      ),
    );
  }

  _jsonToMapBtn() {
    return ElevatedButton(onPressed: _jsonToMap, child: const Text("Json转Map"));
  }

  _jsonToDartModelBtn() {
    return ElevatedButton(
        onPressed: _jsonToDartModel, child: const Text("Json转DartModel"));
  }

  _jsonToMap() {
    var json =
        '{"code": 200, "data": {"code": 210, "requestParams": "Success"}, "ibfilecount": 100}';
    Map<String, dynamic> map = jsonDecode(json);
    setState(() {
      resultMap =
          "'code': ${map['code']}\n 'data': {\n\t'code': ${map['data']['code']}\n\t'requestParams': ${map['data']['requestParams']}}\n\t'ibfilecount': ${map['ibfilecount']}";
    });
  }

  _jsonToDartModel() {
    var json =
        '{"code": 200, "data": {"code": 210, "requestParams": "Success"}, "ibfilecount": 100}';
    Map<String, dynamic> map = jsonDecode(json);
    DartModel03 dartModel03 = DartModel03.fromJson(map);
    setState(() {
      resultDartModel =
          "'code': ${dartModel03.code}\n 'data': {\n\t'code': ${dartModel03.data?['code']}\n\t'requestParams': ${dartModel03.data?['requestParams']}, \n\t'ibfilecount': ${dartModel03.ibfilecount}";
    });
  }
}
