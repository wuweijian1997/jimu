import 'package:animated_flex/animated_flex.dart';
import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import 'package:jimu/widgets/index.dart';

class RegisterPage extends StatefulWidget {
  static const rName = 'register';

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> with SingleTickerProviderStateMixin{
  TextEditingController _editingController;
  AnimationController _animationController;

  final _spring = const SpringDescription(
    ///质量
    mass: 1,

    ///刚性,滚动收尾速度
    stiffness: 100,

    ///阻尼,摩擦力
    damping: 5,
  );

  @override
  void initState() {
    super.initState();
    _editingController = TextEditingController(text: '');
    _animationController = AnimationController(
        value: 0, lowerBound: -50, upperBound: 50, vsync: this);
  }

  onSubmit(String value) {
    if(value.length == 11) {
      ///去下一个页面
    } else {
      ///提示错误
      final simulation = SpringSimulation(_spring, 0, 0, 300);
      _animationController.animateWith(simulation);
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
                    return Transform.translate(
                      offset: Offset(_animationController.value, 0),
                      child: child,
                    );
                  },
                  child: JmPhoneNumberInput(
                    controller: _editingController,
                    onSubmit: onSubmit,
                  ),
                ),
              ],
            ),
            JmButton(
              onClick: () => onSubmit(_editingController.text),
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
