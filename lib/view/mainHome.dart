import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:itargs_task/view/home.dart';
import 'package:itargs_task/translation/local_keys.g.dart';

import 'more.dart';



class MainHome extends StatefulWidget {
  const MainHome({Key? key}) : super(key: key);

  @override
  State<MainHome> createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
List pageList=[const Home(), More()];

bool selected=true;
int index=0;
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(onTap: (ind){
setState(() {
index=ind;
  selected= !selected;
});
      },
        activeColor: CupertinoColors.systemIndigo.highContrastColor,
        inactiveColor: CupertinoColors.black,
        items: [
          BottomNavigationBarItem(
              icon:index==0?SvgPicture.asset('assets/icon/purpleHome.svg'):SvgPicture.asset('assets/icon/blackHome.svg'), label: LocaleKeys.home.tr()),
          BottomNavigationBarItem(
              icon:index==1? SvgPicture.asset('assets/icon/purpleMore.svg'):SvgPicture.asset('assets/icon/blackMore.svg'), label:  LocaleKeys.more.tr())
        ],
      ),
      tabBuilder: (BuildContext context, int index) => CupertinoTabView(
        builder: (context) =>pageList[index],
        ),

    );
  }
}
