import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../utils/app_color.dart';

class ScoreCardItem extends StatelessWidget {
  double percent;
  double fat;
  double weigth;
  double water;

  ScoreCardItem({
    Key? key,
    required this.percent,
    required this.fat,
    required this.weigth,
    required this.water,
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
                        "Body Score",
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
                  flex: 1,
                  child: Text(
                    "${percent.toString()}%",
                    style: Theme.of(context)
                        .textTheme
                        .headline1!
                        .copyWith(color: AppColors.primaryColor, fontSize: 14),
                    textAlign: TextAlign.end,
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
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            fat.toString(),
                            style: Theme.of(context)
                                .textTheme
                                .headline1!
                                .copyWith(fontSize: 15),
                          ),
                          Text(
                            " %",
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(fontSize: 12),
                          ),
                        ],
                      ),
                      const Text(
                        "Body fat",
                        style: TextStyle(fontSize: 11),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            weigth.toString(),
                            style: Theme.of(context)
                                .textTheme
                                .headline1!
                                .copyWith(fontSize: 15),
                          ),
                          Text(
                            " Kg",
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(fontSize: 12),
                          ),
                        ],
                      ),
                      const Text(
                        "Weight",
                        style: TextStyle(fontSize: 11),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            water.toString(),
                            style: Theme.of(context)
                                .textTheme
                                .headline1!
                                .copyWith(fontSize: 15),
                          ),
                          Text(
                            " %",
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(fontSize: 12),
                          ),
                        ],
                      ),
                      const Text(
                        "water",
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
