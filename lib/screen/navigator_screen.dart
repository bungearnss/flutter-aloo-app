import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/app_drawer.dart';
import './activity_screen.dart';
import './home_screen.dart';
import './profile_screen.dart';

import '../utils/app_color.dart';

import '../providers/screen_controller.dart';

class NavigatorScreen extends StatefulWidget {
  const NavigatorScreen({Key? key}) : super(key: key);

  @override
  State<NavigatorScreen> createState() => _NavigatorScreenState();
}

class _NavigatorScreenState extends State<NavigatorScreen>
    with SingleTickerProviderStateMixin {
  late int pageIndex;
  late double _scale;
  late AnimationController _controller;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  final pages = [
    const HomeScreen(),
    const ActivityScreen(),
    const ProfileScreen(),
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
      lowerBound: 0.0,
      upperBound: 0.1,
    )..addListener(() {
        setState(() {});
      });

    pageIndex =
        Provider.of<ScreenController>(context, listen: false).screenIndex;
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  void _tapDown(TapDownDetails details) {
    _controller.forward();
  }

  void _tapUp(TapUpDetails details) {
    _controller.reverse();
  }

  @override
  Widget build(BuildContext context) {
    _scale = 1 - _controller.value;
    return Scaffold(
      key: scaffoldKey,
      drawerScrimColor: Colors.transparent,
      drawer: const AppDrawer(),
      body: Consumer<ScreenController>(
        builder: ((context, controller, child) => Stack(
              alignment: AlignmentDirectional.center,
              children: [
                pages[controller.screenIndex],
                Positioned(
                  bottom: 15,
                  child: Transform.scale(
                    scale: _scale,
                    child: myNavBar(context, controller.screenIndex),
                  ),
                ),
              ],
            )),
      ),
    );
  }

  Widget myNavBar(BuildContext context, int index) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      height: 65,
      width: width * 0.9,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(30)),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 192, 192, 192).withOpacity(0.4),
            spreadRadius: 1,
            blurRadius: 2,
            offset: const Offset(1, 5),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
            onTapUp: _tapUp,
            onTapDown: _tapDown,
            onTap: () {
              setState(() {
                Provider.of<ScreenController>(context, listen: false)
                    .chageScreenIndex(0);
              });
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.home_rounded,
                  color:
                      index == 0 ? AppColors.primaryColor : AppColors.greyColor,
                ),
                Text(
                  "Home",
                  style: index == 0
                      ? Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(color: AppColors.primaryColor)
                      : Theme.of(context).textTheme.bodyText1,
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                Provider.of<ScreenController>(context, listen: false)
                    .chageScreenIndex(1);
              });
            },
            onTapUp: _tapUp,
            onTapDown: _tapDown,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.flag_rounded,
                  color:
                      index == 1 ? AppColors.primaryColor : AppColors.greyColor,
                ),
                Text(
                  "Activity",
                  style: index == 1
                      ? Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(color: AppColors.primaryColor)
                      : Theme.of(context).textTheme.bodyText1,
                ),
              ],
            ),
          ),
          GestureDetector(
            onTapUp: _tapUp,
            onTapDown: _tapDown,
            onTap: () {
              setState(() {
                Provider.of<ScreenController>(context, listen: false)
                    .chageScreenIndex(2);
              });
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.person,
                  color:
                      index == 2 ? AppColors.primaryColor : AppColors.greyColor,
                ),
                Text(
                  "Profile",
                  style: index == 2
                      ? Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(color: AppColors.primaryColor)
                      : Theme.of(context).textTheme.bodyText1,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
