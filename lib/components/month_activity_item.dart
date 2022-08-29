import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../utils/app_color.dart';

import '../funtion/digit_formatter.dart';

class MonthActivityItem extends StatelessWidget {
  Widget icon;
  String value;
  String subtitle;
  String type;
  void Function()? onPressed;

  MonthActivityItem({
    Key? key,
    required this.icon,
    required this.value,
    required this.subtitle,
    required this.type,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    final currentMonth = DateFormat('MMMM').format(now);
    return GestureDetector(
      onTap: onPressed,
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
        width: 150,
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: icon,
            ),
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: Formatter.digitFormatter(int.parse(value)),
                          style: Theme.of(context)
                              .textTheme
                              .headline1!
                              .copyWith(fontSize: 16),
                        ),
                        type == "Distance"
                            ? TextSpan(
                                text: " Km",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(
                                        color: AppColors.greyColor,
                                        fontSize: 12),
                              )
                            : const TextSpan(text: ""),
                      ],
                    ),
                  ),
                  Text(
                    subtitle,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(color: Colors.black, fontSize: 12),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "$type in $currentMonth",
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          color: AppColors.greyColor,
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
