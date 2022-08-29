import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';

import '../utils/app_color.dart';
import '../utils/mockdata.dart';

import '../components/month_activity_item.dart';
import '../components/score_card_item.dart';
import '../components/normal_card.dart';
import '../components/custom_month_picker.dart';
import '../components/activity_graph.dart';
import '../components/app_drawer.dart';
import '../components/progress_arc.dart';
import '../components/header.dart';

import '../funtion/digit_formatter.dart';
import './step_count_screen.dart';
import './cal_burned_Screen.dart';
import './distance_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  double stepPercent(double distance, double goal) {
    double percent = goal / distance;
    return percent;
  }

  String? selectedMonth;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  late Animation<double> _animation;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    final curvedAnimation = CurvedAnimation(
        parent: _animationController, curve: Curves.easeInOutCubic);

    _animation = Tween<double>(
      begin: 0.0,
      end: 3.14 / stepPercent(todayInfo.distance, todayInfo.goal),
    ).animate(curvedAnimation)
      ..addListener(() {
        setState(() {});
      });
    _animationController.forward();
  }

  goToDetailPage(String type) {
    if (type == "Walked") {
      Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const StepCountScreen()));
    }
    if (type == "cal") {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => CalBurnedScreen()));
    }
    if (type == "Distance") {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => DistanceScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    final currentMonth = DateFormat('MMMM').format(now);

    return Scaffold(
      key: scaffoldKey,
      drawerScrimColor: Colors.transparent,
      drawer: const AppDrawer(),
      body: SingleChildScrollView(
        child: Container(
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 26.0, top: 40),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              Formatter.digitFormatter(
                                todayInfo.steps,
                              ),
                              style: Theme.of(context)
                                  .textTheme
                                  .headline1!
                                  .copyWith(color: Colors.white),
                            ),
                            Text(
                              "Steps today",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(color: Colors.white, fontSize: 12),
                            ),
                            const SizedBox(height: 30),
                            Row(
                              children: [
                                const Icon(
                                  Icons.circle_rounded,
                                  color: Colors.white,
                                  size: 6,
                                ),
                                const SizedBox(width: 5),
                                Text(
                                  Formatter.digitFormatter(
                                    todayInfo.cals,
                                  ),
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline1!
                                      .copyWith(
                                          color: Colors.white, fontSize: 15),
                                ),
                                const SizedBox(width: 5),
                                Text(
                                  "Cals",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .copyWith(
                                          color: Colors.white, fontSize: 12),
                                ),
                                const SizedBox(width: 10),
                                const Icon(
                                  Icons.circle_rounded,
                                  color: Colors.white,
                                  size: 6,
                                ),
                                const SizedBox(width: 5),
                                Text(
                                  "${todayInfo.distance}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline1!
                                      .copyWith(
                                          color: Colors.white, fontSize: 15),
                                ),
                                const SizedBox(width: 5),
                                Text(
                                  "Km's",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .copyWith(
                                          color: Colors.white, fontSize: 12),
                                ),
                              ],
                            ),
                            Text(
                              "You have to walk ${todayInfo.goal - todayInfo.distance} Km more",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(color: Colors.white, fontSize: 11),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: Transform.rotate(
                          angle: -1.57,
                          origin: const Offset(5, 0),
                          alignment: Alignment.centerRight,
                          child: Stack(
                            children: [
                              const CustomPaint(
                                size: Size(120, 120),
                                painter: ProgressArc(
                                  arc: null,
                                  progressColor: Colors.white,
                                ),
                              ),
                              CustomPaint(
                                size: const Size(120, 120),
                                painter: ProgressArc(
                                  arc: _animation.value,
                                  progressColor:
                                      AppColors.primaryColor.withOpacity(0.5),
                                ),
                              ),
                              Positioned(
                                top: 32,
                                left: 35,
                                child: Text(
                                  "${(_animation.value / 3.14 * 100).toInt()}%",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline1!
                                      .copyWith(
                                          fontSize: 16, color: Colors.white),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                    top: 30, bottom: 15, left: 20, right: 20),
                child: Text(
                  "This Month Activity",
                  style: Theme.of(context)
                      .textTheme
                      .headline1!
                      .copyWith(fontSize: 12),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, right: 12),
                      child: MonthActivityItem(
                        icon: Image.asset(
                          "assets/shoe_icon.png",
                          width: 30,
                          height: 30,
                        ),
                        value: monthInfo.steps.toString(),
                        subtitle: "Steps",
                        type: "Walked",
                        onPressed: () => goToDetailPage("Walked"),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 12),
                      child: MonthActivityItem(
                        icon: const Icon(
                          Icons.electric_bolt_outlined,
                          color: AppColors.orangeColor,
                          size: 28,
                        ),
                        value: monthInfo.cals.toString(),
                        subtitle: "Cals",
                        type: "Burned",
                        onPressed: () => goToDetailPage("cal"),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 17),
                      child: MonthActivityItem(
                        icon: const Icon(
                          Icons.camera_rounded,
                          color: AppColors.purpleColor,
                          size: 28,
                        ),
                        value: monthInfo.distance.toString(),
                        subtitle: "Distances",
                        type: "Distance",
                        onPressed: () => goToDetailPage("Distance"),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                    top: 20, bottom: 15, left: 20, right: 20),
                child: ScoreCardItem(
                  fat: bodyInfo.fat,
                  percent: bodyInfo.percent,
                  weigth: bodyInfo.weigth,
                  water: bodyInfo.water,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 5, left: 20, right: 20),
                child: NormalCard(
                  child: Row(
                    children: [
                      const Expanded(
                        flex: 1,
                        child: Icon(
                          Icons.pause_rounded,
                          color: AppColors.greyColor,
                          size: 30,
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("02:34",
                                  style: Theme.of(context).textTheme.bodyText1),
                              const SizedBox(height: 3),
                              Text(
                                "7 Rings",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline1!
                                    .copyWith(fontSize: 16),
                              ),
                              const SizedBox(height: 3),
                              Text("Ariana Grande's",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .copyWith(color: Colors.black)),
                            ],
                          ),
                        ),
                      ),
                      const Expanded(
                        flex: 1,
                        child: Icon(
                          Icons.graphic_eq_outlined,
                          color: AppColors.primaryColor,
                          size: 35,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                    top: 20, bottom: 15, left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Activity Timing",
                      style: Theme.of(context)
                          .textTheme
                          .headline1!
                          .copyWith(fontSize: 12),
                    ),
                    GestureDetector(
                      onTap: () {
                        DatePicker.showPicker(context,
                            pickerModel: CustomMonthPicker(
                              minTime: DateTime(2020, 1, 1),
                              maxTime: DateTime.now(),
                              currentTime: DateTime.now(),
                            ), onConfirm: (date) {
                          setState(() {
                            selectedMonth = DateFormat('MMMM').format(date);
                          });
                        });
                      },
                      child: Row(
                        children: [
                          Text(
                            selectedMonth ?? currentMonth,
                            style: Theme.of(context)
                                .textTheme
                                .headline1!
                                .copyWith(
                                    fontSize: 12,
                                    color: AppColors.primaryColor),
                          ),
                          const SizedBox(width: 1),
                          const Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: AppColors.primaryColor,
                            size: 15,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const ActivityGraph(),
            ],
          ),
        ),
      ),
    );
  }
}
