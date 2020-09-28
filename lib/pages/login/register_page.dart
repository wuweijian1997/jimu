import 'package:animated_flex/animated_flex.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  static const rName = 'register';

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
        child: AnimatedFlex(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('登录/注册 更精彩', style: Theme.of(context).textTheme.headline1,),
            SizedBox(height: 30,),
            Text('输入手机号后,开始积目!未注册手机,将自动进入注册页面', style: Theme.of(context).textTheme.bodyText1.copyWith(color: Colors.white54),),
          ],
        ),
      ),
    );
  }
}
