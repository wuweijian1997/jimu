import 'package:animated_flex/animated_flex.dart';
import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import 'package:jimu/common/index.dart';
import 'package:jimu/widgets/index.dart';

class PasswordLoginPage extends StatefulWidget {
  static const String rName = "passwordLogPage";
  final PhoneModel phoneModel;

  PasswordLoginPage({@required this.phoneModel});

  @override
  _PasswordLoginPageState createState() => _PasswordLoginPageState();
}

class _PasswordLoginPageState extends State<PasswordLoginPage> with SingleTickerProviderStateMixin{

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

  String get areaCode => widget.phoneModel.areaCode;

  String get phoneNumber => widget.phoneModel.phoneNumber;

  onSubmit(String value) {
    if(value.length == 11) {
      ///去下一个页面
      NavigatorUtil.pushName(PasswordLoginPage.rName, arguments: PhoneModel(phoneNumber: value, areaCode: '86'));
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
                  '账号登录',
                  style: Theme.of(context).textTheme.headline1,
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    ClipOval(
                        child: Container(
                      width: 10,
                      height: 10,
                      color: Colors.white,
                          padding: EdgeInsets.only(right: 5),
                    )),
                    SizedBox(width: 10,),
                    Text('+$areaCode $phoneNumber', style: Theme.of(context).textTheme.subtitle1,),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  '输入密码后请点击"开始JiMu"即刻进入积目世界!粗心的你如忘记密码,请点击右上角的"忘"重新设置~',
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
