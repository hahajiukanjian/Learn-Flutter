import 'package:flutter/material.dart';
import 'package:started_flutter/utils/string_util.dart';
import 'package:started_flutter/utils/view_util.dart' as PWViewUtil;
import 'package:started_flutter/widgets/input_widget.dart';

/// 登录页
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool loginEnable = false;
  String? userName;
  String? password;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          ..._background(height: screenHeight, width: screenWidth),
          _content(height: screenHeight, width: screenWidth),
        ],
      ),
    );
  }

  _background({height, width}) {
    return [
      Positioned.fill(
        child: Container(decoration: const BoxDecoration(color: Colors.white)),
      ),
      Positioned(
        top: height < 1920 ? height * 0.1 : 100,
        left: width < 1080 ? width * 0.32 : 200,
        // right: width * 0.34,
        width: width < 1080 ? width * 0.35 : 200,
        child: Image.asset("images/colorful-pinwu-logo.png"),
      ),
    ];
  }

  _content({height, width}) {
    return Positioned.fill(
      left: 25,
      right: 25,
      child: ListView(
        children: [
          PWViewUtil.hiSpace(height: height < 1920 ? height * 0.3 : 200.0),
          Text("账号密码登录",
              style: TextStyle(fontSize: width < 1080 ? width * 0.05 : 32)),
          PWViewUtil.hiSpace(height: height < 1920 ? height * 0.03 : 75),
          InputWidget(
            "请输入账号",
            onChanged: (text) {
              userName = text;
              _checkLogin();
            },
          ),
          PWViewUtil.hiSpace(height: height < 1920 ? height * 0.03 : 75),
          InputWidget(
            "请输入密码",
            onChanged: (text) {
              password = text;
              _checkLogin();
            },
            obscureText: true,
          ),
        ],
      ),
    );
  }

  _checkLogin() {
    return loginEnable =
        (isNotEmpty(userName) && isNotEmpty(password) ? true : false);
  }
}
