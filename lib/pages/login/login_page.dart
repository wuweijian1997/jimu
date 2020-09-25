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
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: AnimationList(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  Assets.icon_splash_content,
                  width: 160.dp,
                  height: 100.dp,
                  color: Colors.white,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'FIND|CONNECT|DATE|YOUTH CULTURE',
                  style: Theme.of(context).textTheme.bodyText2,
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'Focus on youth social network',
                  style: Theme.of(context).textTheme.overline,
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                    width: double.infinity,
                    height: 50,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: ShaderMask(
                      blendMode: BlendMode.srcOut,
                      shaderCallback: (bounds) {
                        return LinearGradient(
                          colors: [Colors.black, Colors.black],
                        ).createShader(bounds);
                      },
                      child: Text(
                        'Hello World',
                        style: Theme.of(context).textTheme.headline4.copyWith(color: Colors.white),
                      ),
                    )),
              ],
            ),
          ),
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
