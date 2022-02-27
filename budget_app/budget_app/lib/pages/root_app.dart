import 'package:budget_app/pages/budget_page.dart';
import 'package:budget_app/pages/create_budget.dart';
import 'package:budget_app/pages/daily_page.dart';
import 'package:budget_app/pages/profile_page.dart';
import 'package:budget_app/pages/stats_page.dart';
import 'package:flutter/material.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import '../theme/colors.dart';

class rootApp extends StatefulWidget {
  const rootApp({Key? key}) : super(key: key);

  @override
  _rootAppState createState() => _rootAppState();
}

class _rootAppState extends State<rootApp> {
  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(),
      bottomNavigationBar: getFooter(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setTab(4);
        },
        backgroundColor: primary,
        child: const Icon(
          Icons.add,
          size: 25.0,
        ),
      ),
    );
  }

  Widget getBody() {
    return IndexedStack(
      index: pageIndex,
      children: const [
        DailyPage(),
        StatsPage(),
        BudgetPage(),
        ProfilePage(),
        CreateBudget(),
      ],
    );
  }

  Widget getFooter() {
    List<IconData> iconItems = [
      Icons.settings,
      Icons.report,
      Icons.wallet_travel,
      Icons.person,
    ];
    return AnimatedBottomNavigationBar(
        gapLocation: GapLocation.center,
        icons: iconItems,
        splashColor: secondary,
        notchSmoothness: NotchSmoothness.softEdge,
        activeColor: primary,
        inactiveColor: black.withOpacity(0.5),
        leftCornerRadius: 10.0,
        rightCornerRadius: 10.0,
        iconSize: 25.0,
        activeIndex: pageIndex,
        onTap: (index) {
          setTab(index);
        });
  }

  setTab(index) {
    setState(() {
      pageIndex = index;
    });
  }
}
