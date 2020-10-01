import 'package:flutter/material.dart';

class JmButton extends StatefulWidget {
  final VoidCallback onClick;
  final Duration delayed;
  final Widget child;

  const JmButton({
    @required this.onClick,
    @required this.child,
    this.delayed = const Duration(milliseconds: 300)
  });

  @override
  _JmButtonState createState() => _JmButtonState();
}

class _JmButtonState extends State<JmButton> {
  bool _isBlock = false;

  VoidCallback get onClick => widget.onClick;

  Duration get delayed => widget.delayed;

  Widget get child => widget.child;

  throttle() {
    if (!_isBlock) {
      _isBlock = true;
      onClick?.call();
      Future.delayed(delayed, () {
        _isBlock = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: throttle,
      child: child,
    );
  }
}

class JmLoginButton extends StatelessWidget {
  final String title;
  final VoidCallback onClick;

  JmLoginButton({@required this.title, this.onClick});

  @override
  Widget build(BuildContext context) {
    return JmButton(
        onClick: onClick,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.arrow_drop_down, size: 36, color: Colors.white54),
            Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  .copyWith(letterSpacing: 2, color: Colors.white54),
            ),
            SizedBox(
              height: 30,
            ),
          ],
        )
    );
  }
}
