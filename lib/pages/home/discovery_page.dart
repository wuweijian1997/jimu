import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:jimu/common/index.dart';

///发现
class DiscoveryPage extends StatelessWidget {
  static const rName = 'DiscoveryPage';

  const DiscoveryPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const _DiscoveryHeader(),
          const _DiscoveryCard(),
        ],
      ),
    );
  }
}

class _DiscoveryHeader extends StatelessWidget {
  const _DiscoveryHeader();

  @override
  Widget build(BuildContext context) {
    var top = MediaQueryData.fromWindow(window).padding.top;
    Log.info('top:$top', StackTrace.current);
    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 10, right: 20, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(vertical: 1, horizontal: 2),
                decoration: BoxDecoration(
                  color: Colors.yellow,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  '直播',
                  style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(width: 10,),
              Container(
                child: Row(
                  children: [
                    Icon(Icons.location_on, color: Colors.yellow,),
                    Text('上海市'),
                  ],
                ),
              )
            ],
          ),
          Row(
            children: [
              Text('喜欢我:'),
              Icon(Icons.location_on, color: Colors.yellow,),
              Icon(Icons.location_on, color: Colors.yellow,),
              Icon(Icons.location_on, color: Colors.yellow,),
            ],
          )
        ],
      ),
    );
  }
}

class _DiscoveryCard extends StatelessWidget {

  const _DiscoveryCard();

  @override
  Widget build(BuildContext context) {
    return Expanded(child: Container(color: Colors.white,));
  }

}
