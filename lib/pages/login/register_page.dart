import 'package:animated_flex/animated_flex.dart';
import 'package:flutter/material.dart';
import 'package:jimu/common/index.dart';

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
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
        child: AnimatedFlex(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('登录/注册 更精彩', style: Theme.of(context).textTheme.headline1,),
            SizedBox(height: 30,),
            Text('输入手机号后,开始积目!未注册手机,将自动进入注册页面', style: Theme.of(context).textTheme.bodyText1.copyWith(color: Colors.white54),),
            SizedBox(height: 40,),
            TextField(
              style: Theme.of(context).textTheme.bodyText2,
              autofocus: true,
              maxLength: 11,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 0,horizontal: 20),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide(width: 2), ),
                focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide(width: 2), ),
                hintText: '请输入正确手机号',
                hintStyle: Theme.of(context).textTheme.bodyText2.copyWith(color: Colors.white70),
                counterText: '',
                // counter: null,
                prefix: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('+86', style: Theme.of(context).textTheme.bodyText2,),
                    Icon(Icons.arrow_drop_down, color: AppTheme.HINT_COLOR,),
                    Container(
                      color: AppTheme.HINT_COLOR,
                      width: 1,
                      height: 20,
                      margin: EdgeInsets.only(right: 10),
                    ),
                  ],
                ),
                suffixIcon: Icon(Icons.clear, color: Theme.of(context).iconTheme.color,)
              ),
              onSubmitted: (text) {

              },
            ),
          ],
        ),
      ),
    );
  }
}
