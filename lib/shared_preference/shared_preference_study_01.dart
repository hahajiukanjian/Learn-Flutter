import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SPCounter01Widget extends StatefulWidget {
  const SPCounter01Widget({super.key});

  @override
  State<StatefulWidget> createState() => _SPCounter01WidgetState();
}

class _SPCounter01WidgetState extends State<SPCounter01Widget> {
  var countString = "";
  var countVar = "";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: false),
      home: Scaffold(
        appBar: AppBar(title: const Text("Shared Preference本地存储学习")),
        body: Column(
          children: [
            ElevatedButton(
              onPressed: _incrementCounter,
              child: const Text("增加", style: TextStyle(color: Colors.pink)),
            ),
            ElevatedButton(
              onPressed: _getCounter,
              child: const Text("展示", style: TextStyle(color: Colors.black)),
            ),
            Text(countString, style: const TextStyle(fontSize: 10)),
            const Text("result: \n", style: TextStyle(color: Colors.red)),
            Text(countVar, style: const TextStyle(fontSize: 20)),
          ],
        ),
      ),
    );
  }

  _incrementCounter() async {
    SharedPreferences spfs = await SharedPreferences.getInstance();
    setState(() {
      countString = "$countString 1";
    });
    int counter = (spfs.getInt('counter') ?? 0) + 1;
    await spfs.setInt('counter', counter);
  }

  _getCounter() async {
    SharedPreferences spfs = await SharedPreferences.getInstance();
    setState(() {
      countVar = spfs.getInt('counter').toString();
    });
  }
}
