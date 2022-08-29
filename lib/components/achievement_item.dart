import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

import '../utils/app_color.dart';

class AcheivementItem extends StatelessWidget {
  int achievement;
  int avgStep;
  int totalKm;

  AcheivementItem({
    Key? key,
    required this.achievement,
    required this.avgStep,
    required this.totalKm,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    final currentDate = DateFormat('d MMMM y K:m a').format(now);
    return Container(
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
      child: Padding(
        padding:
            const EdgeInsets.only(left: 18, right: 18, top: 20, bottom: 25),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  flex: 5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Achievements",
                        style: Theme.of(context)
                            .textTheme
                            .headline1!
                            .copyWith(fontSize: 15),
                      ),
                      Text(
                        currentDate,
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              color: AppColors.greyColor,
                            ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(bottom: 3.0),
                            child: Icon(Icons.favorite,
                                color: AppColors.primaryColor, size: 14),
                          ),
                          const SizedBox(width: 5),
                          Text(
                            "${achievement.toString()}/20",
                            style: Theme.of(context)
                                .textTheme
                                .headline1!
                                .copyWith(
                                    color: AppColors.primaryColor,
                                    fontSize: 14),
                            textAlign: TextAlign.end,
                          ),
                        ],
                      ),
                      Text(
                        "Heart Points",
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(color: AppColors.greyColor),
                      ),
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(height: 15),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        avgStep.toString(),
                        style: Theme.of(context)
                            .textTheme
                            .headline1!
                            .copyWith(fontSize: 15),
                      ),
                      const Text(
                        "Avg Steps",
                        style: TextStyle(fontSize: 11),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        totalKm.toString(),
                        style: Theme.of(context)
                            .textTheme
                            .headline1!
                            .copyWith(fontSize: 15),
                      ),
                      const Text(
                        "Total Kilometers",
                        style: TextStyle(fontSize: 11),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              "All are going good continue daily walking"
              "more than 60 mins to maintain your health",
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    color: AppColors.greyColor,
                  ),
              maxLines: 2,
            ),
          ],
        ),
      ),
    );
  }
}
