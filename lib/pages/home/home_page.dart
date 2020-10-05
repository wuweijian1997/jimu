import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jimu/common/index.dart';
import 'package:jimu/pages/index.dart';
import 'package:jimu/widgets/index.dart';

class HomePage extends StatefulWidget {
  static const String rName = "HomePage";

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int bottomBarIndex = 0;

  onSelect(int index) {
    assert(index != null);
    if (index != bottomBarIndex) {
      setState(() {
        bottomBarIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          IndexedStack(
            index: bottomBarIndex,
            children: [
              const DialoguePage(),
              const CommunityPage(),
              const DiscoveryPage(),
              const SpeedDatingPage(),
              const MinePage(),
            ],
          ),
          Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: _HomeBottomNavigationBar(
                selected: bottomBarIndex,
                onSelected: onSelect,
              )),
        ],
      ),
    );
  }
}

class _HomeBottomNavigationBar extends StatelessWidget {
  final int selected;
  final ValueChanged<int> onSelected;

  const _HomeBottomNavigationBar(
      {@required this.selected, @required this.onSelected});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: buildList(),
      ),
    );
  }

  buildList() {
    List<Widget> list = [];
    for (int i = 0; i < Const.bottomNavigationBar.length; i++) {
      var model = Const.bottomNavigationBar[i];
      var child = Button(
          onClick: () => onSelected(i),
          child: _BottomNavigationBarItem(
            model: model,
            selected: selected == i,
          ));
      list.add(child);
    }
    return list;
  }
}

class _BottomNavigationBarItem extends StatelessWidget {
  final BottomNavigationModel model;
  final bool selected;

  _BottomNavigationBarItem({this.model, this.selected});

  @override
  Widget build(BuildContext context) {
    final icon = selected == true ? model.selected : model.unselected;
    return Column(
      children: [
        Image.asset(icon, width: 45, height: 45, fit: BoxFit.cover),
        Text(model.title, style: Theme.of(context).textTheme.overline,),
      ],
    );
  }
}
