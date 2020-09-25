import 'package:flutter/material.dart';

class AnimationList extends StatefulWidget {
  final Axis direction;

  final MainAxisAlignment mainAxisAlignment;

  final MainAxisSize mainAxisSize;

  final CrossAxisAlignment crossAxisAlignment;

  final TextDirection textDirection;

  final VerticalDirection verticalDirection;

  final TextBaseline textBaseline;

  final Clip clipBehavior;

  final List<Widget> children;

  final Duration duration;

  const AnimationList({
    Key key,
    this.direction = Axis.vertical,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.mainAxisSize = MainAxisSize.max,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.textDirection,
    this.verticalDirection = VerticalDirection.down,
    this.textBaseline,
    this.clipBehavior = Clip.hardEdge,
    this.children = const <Widget>[],
    this.duration = const Duration(milliseconds: 1000),
  }) : super(key: key);

  @override
  _AnimationListState createState() => _AnimationListState();
}

class _AnimationListState extends State<AnimationList> with SingleTickerProviderStateMixin {
  AnimationController animationController;

  Axis get direction => widget.direction;

  MainAxisAlignment get mainAxisAlignment => widget.mainAxisAlignment;

  MainAxisSize get mainAxisSize => widget.mainAxisSize;

  CrossAxisAlignment get crossAxisAlignment => widget.crossAxisAlignment;

  TextDirection get textDirection => widget.textDirection;

  VerticalDirection get verticalDirection => widget.verticalDirection;

  TextBaseline get textBaseline => widget.textBaseline;

  Clip get clipBehavior => widget.clipBehavior;

  List<Widget> get children => widget.children;

  Duration get duration => widget.duration;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(vsync: this, duration: duration);
    animationController.forward();
  }

  List<Widget> initAnimationList() {
    List<Widget> list = [];
    int count = children.length;
    for (int i = 0; i < count; i++) {
      final Animation<double> animation = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
          parent: animationController,
          curve: Interval((1 / count) * i, 1.0, curve: Curves.fastOutSlowIn),
        ),
      );
      list.add(buildAnimationWidget(animation, animationController, children[i]));
    }
    return list;
  }

  buildAnimationWidget(Animation animation, AnimationController controller, Widget child) {
    return AnimatedBuilder(
      animation: controller,
      builder: (BuildContext context, Widget child) {
        return Opacity(
          opacity: animation.value,
          child: Transform(
            transform: buildTransform(animation),
            child: child,
          ),
        );
      },
      child: child,
    );
  }

  buildTransform(Animation animation) {
    return Matrix4.translationValues(0, 10 * (1.0 - animation.value), 0.0);
  }


  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: direction,
      children: initAnimationList(),
      mainAxisAlignment: mainAxisAlignment,
      mainAxisSize: mainAxisSize,
      crossAxisAlignment: crossAxisAlignment,
      textDirection: textDirection,
      verticalDirection: verticalDirection,
      textBaseline: textBaseline,
      clipBehavior: clipBehavior,
    );
  }
}
