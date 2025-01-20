import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SPStudy02 extends StatefulWidget {
  const SPStudy02({super.key});

  @override
  State<SPStudy02> createState() => _SPStudy02State();
}

class _SPStudy02State extends State<SPStudy02> {
  var countString = '';
  var countVar = '';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: false),
      home: Scaffold(
        appBar: AppBar(title: const Text("本地存储测试")),
        body: Column(
          children: [
            _increaseCountBtn(),
            _getCountBtn(),
            const Text(
              "增加的值:\n",
              style: TextStyle(fontSize: 30, color: Colors.lightBlue),
            ),
            Text(countString),
            const Text(
              "结果:\n",
              style: TextStyle(fontSize: 30, color: Colors.lightBlue),
            ),
            Text(countVar),
          ],
        ),
      ),
    );
  }

  _increaseCountBtn() {
    return ElevatedButton(onPressed: _increaseCount, child: const Text("增加"));
  }

  _getCountBtn() {
    return ElevatedButton(onPressed: _getCount, child: const Text("获取"));
  }

  void _increaseCount() async {
    SharedPreferences spfs = await SharedPreferences.getInstance();
    setState(() {
      countString = "$countString 1";
    });
    int counter = (spfs.getInt('counter') ?? 0) + 1;
    await spfs.setInt('counter', counter);
  }

  void _getCount() async {
    SharedPreferences spfs = await SharedPreferences.getInstance();
    setState(() {
      countVar = spfs.getInt('counter').toString();
    });
  }
}
