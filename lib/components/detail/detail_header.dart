import 'package:flutter/material.dart';
import 'package:flutter_aloo_app/utils/app_color.dart';
import 'package:intl/intl.dart';

class DetailHeader extends StatelessWidget {
  Widget icon;
  int value;
  String type;

  DetailHeader({
    Key? key,
    required this.icon,
    required this.value,
    required this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    final currentMonth = DateFormat('MMMM').format(now);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(flex: 2, child: icon),
          Expanded(
            flex: 6,
            child: Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "$value",
                    style: Theme.of(context)
                        .textTheme
                        .headline1!
                        .copyWith(fontSize: 18),
                  ),
                  Text(
                    type,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(color: Colors.black),
                  ),
                  const SizedBox(height: 5),
                  Text("$type in $currentMonth",
                      style: Theme.of(context).textTheme.bodyText1),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 4),
              decoration: BoxDecoration(
                color: AppColors.greenColor.withOpacity(0.2),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  width: 1,
                  color: AppColors.greenColor,
                ),
              ),
              child: Center(
                child: Text(
                  "Good",
                  style: Theme.of(context)
                      .textTheme
                      .headline1!
                      .copyWith(fontSize: 11, color: AppColors.greenColor),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
