import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../utils/app_color.dart';

import '../components/detail_appbar.dart';
import '../components/detail/detail_header.dart';
import '../components/option_item.dart';

import '../model/options.dart';

class StepCountScreen extends StatefulWidget {
  const StepCountScreen({Key? key}) : super(key: key);

  @override
  State<StepCountScreen> createState() => _StepCountScreenState();
}

goBack(BuildContext context) {
  Navigator.pop(context);
}

final item = [
  Options(label: "1258", sublabel: "Steps", unit: "July 01"),
  Options(label: "4288", sublabel: "Steps", unit: "July 05"),
  Options(label: "4521", sublabel: "Steps", unit: "July 06"),
  Options(label: "7896", sublabel: "Steps", unit: "July 07"),
  Options(label: "4255", sublabel: "Steps", unit: "July 08"),
  Options(label: "4559", sublabel: "Steps", unit: "July 09"),
  Options(label: "5428", sublabel: "Steps", unit: "July 10"),
  Options(label: "5327", sublabel: "Steps", unit: "July 13"),
  Options(label: "8894", sublabel: "Steps", unit: "July 14"),
  Options(label: "1385", sublabel: "Steps", unit: "July 16"),
  Options(label: "7856", sublabel: "Steps", unit: "July 17"),
  Options(label: "3568", sublabel: "Steps", unit: "July 20"),
  Options(label: "5688", sublabel: "Steps", unit: "July 21", last: true),
];

class _StepCountScreenState extends State<StepCountScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: detailAppbar(
        "Step Counts",
        context,
        () => goBack(context),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            DetailHeader(
              icon: Image.asset("assets/shoe_icon.png"),
              value: 50263,
              type: "Steps",
            ),
            SizedBox(
              width: width,
              height: height * 0.7,
              child: ListView.builder(
                itemCount: item.length,
                itemBuilder: (context, index) {
                  return OptionItem(item: item[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
