import 'package:flutter/material.dart';

import '../model/options.dart';

import '../components/app_drawer.dart';
import '../components/header.dart';
import '../components/achievement_item.dart';
import '../components/normal_card.dart';
import '../components/option_item.dart';

import '../utils/app_color.dart';
import '../utils/mockdata.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

final goalItem = [
  Options(label: "Activity Goal", value: 8000, unit: "Steps"),
  Options(label: "Weight Goal", value: 62, unit: "Kg", last: true),
];

final moreItem = [
  Options(label: "Friends"),
  Options(label: "Add Accounts"),
  Options(label: "Behavior Tracking"),
  Options(label: "Help"),
  Options(label: "Feedback", last: true),
];

Widget getCard(BuildContext context, double height, Widget child) {
  final width = MediaQuery.of(context).size.width;
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 192, 192, 192).withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 2,
            offset: const Offset(1, 5),
          ),
        ],
      ),
      padding: const EdgeInsets.only(left: 18, right: 18, top: 10, bottom: 25),
      width: width,
      height: height,
      child: child,
    ),
  );
}

class _ProfileScreenState extends State<ProfileScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawerScrimColor: Colors.transparent,
      drawer: const AppDrawer(),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              AppColors.bottomBgColor,
              AppColors.topBgColor,
            ],
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Header(
                onPressed: () {
                  if (scaffoldKey.currentState!.isDrawerOpen) {
                    scaffoldKey.currentState!.closeDrawer();
                  } else {
                    scaffoldKey.currentState!.openDrawer();
                  }
                },
                child: Container(
                  margin: const EdgeInsets.only(left: 26.0, top: 60, right: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(top: 21),
                        alignment: Alignment.bottomCenter,
                        width: 55,
                        height: 55,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Icon(
                          Icons.person_rounded,
                          color: AppColors.primaryColor,
                          size: 42,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        userInfo.name,
                        style: Theme.of(context)
                            .textTheme
                            .headline1!
                            .copyWith(color: Colors.white, fontSize: 18),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Image.asset("assets/badge_icon.png"),
                          const SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Rank",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 11,
                                ),
                              ),
                              Text(userInfo.rank.toString(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline1!
                                      .copyWith(
                                          color: Colors.white, fontSize: 16)),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, top: 40, right: 20),
                child: AcheivementItem(
                  achievement: userInfo.achievement,
                  avgStep: userInfo.avgStep,
                  totalKm: userInfo.totalKm,
                ),
              ),
              const SizedBox(height: 20),
              Container(
                margin: const EdgeInsets.only(left: 20, right: 20),
                child: NormalCard(
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Image.asset("assets/watch.png"),
                      ),
                      Expanded(
                        flex: 3,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Connect your device",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline1!
                                    .copyWith(fontSize: 16),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                  "Connect the device via bluetooth to get"
                                  " your missing informations & keep tracking your"
                                  " daily activity",
                                  style: Theme.of(context).textTheme.bodyText1),
                              const SizedBox(height: 5),
                              FlatButton(
                                onPressed: () {},
                                height: 35,
                                color: AppColors.primaryColor,
                                textColor: Colors.white,
                                child: const Text(
                                  "Connect",
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 25, bottom: 20),
                child: Text(
                  "My Goals",
                  style: Theme.of(context)
                      .textTheme
                      .headline1!
                      .copyWith(fontSize: 16),
                ),
              ),
              getCard(
                context,
                180,
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: goalItem.length,
                  itemBuilder: (context, index) {
                    return OptionItem(item: goalItem[index]);
                  },
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 25, bottom: 20),
                child: Text(
                  "More",
                  style: Theme.of(context)
                      .textTheme
                      .headline1!
                      .copyWith(fontSize: 16),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 100),
                child: getCard(
                  context,
                  290,
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: moreItem.length,
                    itemBuilder: (context, index) {
                      return OptionItem(item: moreItem[index]);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
