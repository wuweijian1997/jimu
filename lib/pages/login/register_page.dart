import 'package:animated_flex/animated_flex.dart';
import 'package:flutter/material.dart';
import 'package:jimu/widgets/index.dart';

class RegisterPage extends StatefulWidget {
  static const rName = 'register';

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> with SingleTickerProviderStateMixin{
  TextEditingController _editingController;
  AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _editingController = TextEditingController(text: '');
    _animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 500));

  }

  onSubmit() {
    if(_editingController.text.length == 11) {
      ///去下一个页面
    } else {
      ///提示错误
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      resizeToAvoidBottomPadding: false,
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AnimatedFlex(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '登录/注册 更精彩',
                  style: Theme.of(context).textTheme.headline1,
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  '输入手机号后,开始积目!未注册手机,将自动进入注册页面',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1
                      .copyWith(color: Colors.white54),
                ),
                SizedBox(
                  height: 40,
                ),
                AnimatedBuilder(
                  animation: _animationController,
                  builder: (BuildContext context, Widget child) {
return child;
                  },
                  child: JmPhoneNumberInput(
                    controller: _editingController,
                  ),
                ),
              ],
            ),
            JmButton(
              onClick: onSubmit,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.arrow_drop_down, size: 36, color: Colors.white54),
                  Text(
                    '下一步',
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        .copyWith(letterSpacing: 2, color: Colors.white54),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
