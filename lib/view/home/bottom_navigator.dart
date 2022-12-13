import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rare_task/res/app_constants.dart';
import 'package:rare_task/view/home/home_screen.dart';
import 'package:rare_task/view/profile/profile_screen.dart';

class BottomNavigator extends StatefulWidget {
  const BottomNavigator({Key? key}) : super(key: key);

  @override
  State<BottomNavigator> createState() => _BottomNavigatorState();
}

class _BottomNavigatorState extends State<BottomNavigator> {
  int _page = 0;
  GlobalKey<CurvedNavigationBarState> _navigationKey = GlobalKey();
  List pages = [
    const HomeScreen(),
    const ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: pages.elementAt(_page),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        key: _navigationKey,
        index: 0,
        height: 60.0,
        items: const <Widget>[
          Icon(
            CupertinoIcons.home,
            size: 30,
            color: AppConstants.blue,
          ),
          Icon(
            CupertinoIcons.person,
            size: 30,
            color: AppConstants.blue,
          ),
        ],
        // color: AppConstants.skobeloff1,
        // buttonBackgroundColor: AppConstants.skobeloff1,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 600),
        onTap: (index) {
          setState(() {
            _page = index;
          });
        },
        letIndexChange: (index) => true,
      ),
    );
  }
}
