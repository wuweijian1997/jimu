import 'package:flutter/material.dart';

///对话
class DialoguePage extends StatelessWidget {
  static const rName = 'DialoguePage';

  const DialoguePage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Text(rName),
      ),
    );
  }
}
