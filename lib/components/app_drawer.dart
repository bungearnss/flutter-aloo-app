import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../utils/app_color.dart';
import '../providers/screen_controller.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final type =
        Provider.of<ScreenController>(context, listen: false).activityType;
    return SizedBox(
      width: 100,
      child: Drawer(
        backgroundColor: Colors.white,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(
              height: 80,
              margin: const EdgeInsets.only(top: 140),
              child: Image.asset(
                "assets/logo.png",
                fit: BoxFit.fitHeight,
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: height * 0.55,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        Provider.of<ScreenController>(context, listen: false)
                            .chageActivityType("Walking");

                        Provider.of<ScreenController>(context, listen: false)
                            .chageScreenIndex(1);
                      });
                    },
                    child: Container(
                      width: 100,
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      decoration: type == "Walking"
                          ? const BoxDecoration(
                              border: Border(
                                right: BorderSide(
                                  width: 5,
                                  color: AppColors.primaryColor,
                                ),
                              ),
                            )
                          : null,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.directions_walk_rounded,
                            size: 30,
                            color: type == "Walking"
                                ? AppColors.primaryColor
                                : AppColors.greyColor,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            "Walking",
                            style:
                                Theme.of(context).textTheme.bodyText1!.copyWith(
                                      fontSize: 11,
                                      fontWeight: FontWeight.bold,
                                      color: type == "Walking"
                                          ? AppColors.primaryColor
                                          : AppColors.greyColor,
                                    ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        Provider.of<ScreenController>(context, listen: false)
                            .chageActivityType("Running");

                        Provider.of<ScreenController>(context, listen: false)
                            .chageScreenIndex(1);
                      });
                    },
                    child: Container(
                      width: 100,
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      decoration: type == "Running"
                          ? const BoxDecoration(
                              border: Border(
                                right: BorderSide(
                                  width: 5,
                                  color: AppColors.primaryColor,
                                ),
                              ),
                            )
                          : null,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.directions_run_rounded,
                            size: 30,
                            color: type == "Running"
                                ? AppColors.primaryColor
                                : AppColors.greyColor,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            "Running",
                            style:
                                Theme.of(context).textTheme.bodyText1!.copyWith(
                                      fontSize: 11,
                                      fontWeight: FontWeight.bold,
                                      color: type == "Running"
                                          ? AppColors.primaryColor
                                          : AppColors.greyColor,
                                    ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        Provider.of<ScreenController>(context, listen: false)
                            .chageActivityType("Cycling");

                        Provider.of<ScreenController>(context, listen: false)
                            .chageScreenIndex(1);
                      });
                    },
                    child: Container(
                      width: 100,
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      decoration: type == "Cycling"
                          ? const BoxDecoration(
                              border: Border(
                                right: BorderSide(
                                  width: 5,
                                  color: AppColors.primaryColor,
                                ),
                              ),
                            )
                          : null,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.directions_bike_rounded,
                            size: 30,
                            color: type == "Cycling"
                                ? AppColors.primaryColor
                                : AppColors.greyColor,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            "Cycling",
                            style:
                                Theme.of(context).textTheme.bodyText1!.copyWith(
                                      fontSize: 11,
                                      fontWeight: FontWeight.bold,
                                      color: type == "Cycling"
                                          ? AppColors.primaryColor
                                          : AppColors.greyColor,
                                    ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        Provider.of<ScreenController>(context, listen: false)
                            .chageActivityType("Tradmill");

                        Provider.of<ScreenController>(context, listen: false)
                            .chageScreenIndex(1);
                      });
                    },
                    child: Container(
                      width: 100,
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      decoration: type == "Tradmill"
                          ? const BoxDecoration(
                              border: Border(
                                right: BorderSide(
                                  width: 5,
                                  color: AppColors.primaryColor,
                                ),
                              ),
                            )
                          : null,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.moped_rounded,
                            size: 30,
                            color: type == "Tradmill"
                                ? AppColors.primaryColor
                                : AppColors.greyColor,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            "Tradmill",
                            style:
                                Theme.of(context).textTheme.bodyText1!.copyWith(
                                      fontSize: 11,
                                      fontWeight: FontWeight.bold,
                                      color: type == "Tradmill"
                                          ? AppColors.primaryColor
                                          : AppColors.greyColor,
                                    ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
