import 'package:budget_ui/pages/create_budget.dart';
import 'package:budget_ui/pages/needs.dart';
import 'package:budget_ui/pages/savings.dart';
import 'package:budget_ui/pages/settings.dart';
import 'package:budget_ui/pages/wants.dart';
import 'package:budget_ui/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';

class RootApp extends StatefulWidget {
  @override
  _RootAppState createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  int pageIndex = 0;
  List<Widget> pages = [
    NeedPage(),
    WantPage(),
    SavingPage(),
    SettingPage(),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    void _showSettingsPanel() {
      showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
            child: CreateBudgetPage(),
          );
        },
      );
    }

    return Scaffold(
      body: getBody(),
      bottomNavigationBar: getFooter(),
      floatingActionButton: FloatingActionButton(
          onPressed: () => _showSettingsPanel(),
          child: Icon(
            Icons.mood,
            size: 25,
          ),
          backgroundColor: Colors.blueAccent
          //params
          ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget getBody() {
    return IndexedStack(
      index: pageIndex,
      children: pages,
    );
  }

  Widget getFooter() {
    List<IconData> iconItems = [
      Icons.home,
      Icons.local_offer,
      Icons.wallet_giftcard,
      Icons.settings,
    ];

    return AnimatedBottomNavigationBar(
      activeColor: Colors.blueAccent,
      splashColor: secondary,
      inactiveColor: Colors.black.withOpacity(0.5),
      icons: iconItems,
      activeIndex: pageIndex,
      gapLocation: GapLocation.center,
      notchSmoothness: NotchSmoothness.softEdge,
      leftCornerRadius: 10,
      iconSize: 25,
      rightCornerRadius: 10,
      onTap: (index) {
        selectedTab(index);
      },
      //other params
    );
  }

  selectedTab(index) {
    setState(() {
      pageIndex = index;
    });
  }
}
