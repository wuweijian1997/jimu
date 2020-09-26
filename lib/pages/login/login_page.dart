import 'package:flutter/material.dart';
import 'package:jimu/common/index.dart';
import 'package:jimu/widgets/index.dart';
import 'package:video_player/video_player.dart';

class LoginPage extends StatelessWidget {
  static const String rName = 'loginPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const _LoginVideoBg(),
          const _LoginContent(),
        ],
      ),
    );
  }
}

class _LoginVideoBg extends StatefulWidget {
  const _LoginVideoBg();

  @override
  _LoginVideoBgState createState() => _LoginVideoBgState();
}

class _LoginVideoBgState extends State<_LoginVideoBg> {
  VideoPlayerController _videoController;

  @override
  void initState() {
    super.initState();
    _videoController = VideoPlayerController.asset(Assets.start_video);
    _videoController.addListener(() {
      setState(() {});
    });
    _videoController.setLooping(true);
    _videoController.initialize().then((_) => setState(() {}));
    _videoController.play();
  }

  @override
  Widget build(BuildContext context) {
    return VideoPlayer(_videoController);
  }
}

class _LoginContent extends StatelessWidget {
  const _LoginContent({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color bgColor = Colors.black;
    return Padding(
      padding: const EdgeInsets.only(bottom: 30.0, left: 30),
      child: AnimationList(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            Assets.icon_splash_content,
            height: 50,
            color: Colors.white,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            'FIND|CONNECT|DATE|YOUTH CULTURE',
            style: Theme.of(context).textTheme.bodyText2,
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            'Focus on youth social network',
            style: Theme.of(context).textTheme.overline,
          ),
          const SizedBox(
            height: 30,
          ),
          StatefulBuilder(builder: (_, setState) {
            return GestureDetector(
              onPanUpdate: (detail) {},
              onPanStart: (_) {
                setState.call(() {
                  bgColor = Colors.white;
                });
              },
              onPanEnd: (_) {
                setState.call(() {
                  bgColor = Colors.black;
                });
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: ShaderMask(
                  blendMode: BlendMode.srcOut,
                  shaderCallback: (bounds) {
                    return LinearGradient(
                      colors: [bgColor, bgColor],
                    ).createShader(bounds);
                  },
                  child: Container(
                    width: double.infinity,
                    height: 50,
                    color: Colors.transparent,
                    alignment: Alignment.center,
                    child: Text(
                      '开始积目',
                      style: Theme.of(context).textTheme.headline4.copyWith(
                            color: Colors.white,
                          ),
                    ),
                  ),
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}
