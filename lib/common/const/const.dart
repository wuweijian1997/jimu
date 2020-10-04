import 'package:jimu/common/index.dart';

class Const {
  static const bottomNavigationBar = [
    const BottomNavigationModel(
        title: '对话',
        selected: Assets.navigation_news_selected,
        unselected: Assets.navigation_news_unselected),
    const BottomNavigationModel(
        title: '社区',
        selected: Assets.navigation_community_selected,
        unselected: Assets.navigation_community_unselected),
    const BottomNavigationModel(
        title: '发现',
        selected: Assets.navigation_find_white_border,
        unselected: Assets.navigation_find_white_border),
    const BottomNavigationModel(
        title: '速配',
        selected: Assets.navigation_voice_match_selected,
        unselected: Assets.navigation_voice_match_unselected),
    const BottomNavigationModel(
        title: '我的',
        selected: Assets.navigation_mine_selected,
        unselected: Assets.navigation_mine_unselected),
  ];
}
