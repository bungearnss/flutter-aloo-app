import 'package:flutter/material.dart';

import '../components/detail/detail_header.dart';
import '../components/detail_appbar.dart';
import '../components/option_item.dart';
import '../model/options.dart';
import '../utils/app_color.dart';

class DistanceScreen extends StatelessWidget {
  DistanceScreen({Key? key}) : super(key: key);

  goBack(BuildContext context) {
    Navigator.pop(context);
  }

  final item = [
    Options(label: "5521", sublabel: "meters", unit: "July 01"),
    Options(label: "4568", sublabel: "meters", unit: "July 05"),
    Options(label: "8254", sublabel: "meters", unit: "July 06"),
    Options(label: "2545", sublabel: "meters", unit: "July 07"),
    Options(label: "8522", sublabel: "meters", unit: "July 08"),
    Options(label: "5569", sublabel: "meters", unit: "July 09"),
    Options(label: "4536", sublabel: "meters", unit: "July 10"),
    Options(label: "5335", sublabel: "meters", unit: "July 13"),
    Options(label: "8826", sublabel: "meters", unit: "July 14"),
    Options(label: "5836", sublabel: "meters", unit: "July 16"),
    Options(label: "4223", sublabel: "meters", unit: "July 17"),
    Options(label: "3538", sublabel: "meters", unit: "July 20"),
    Options(label: "7855", sublabel: "meters", unit: "July 21", last: true),
  ];

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: detailAppbar(
        "Distance Counts",
        context,
        () => goBack(context),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            DetailHeader(
              icon: const Icon(
                Icons.camera_rounded,
                color: AppColors.purpleColor,
                size: 50,
              ),
              value: 48,
              type: "Kilometers",
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
