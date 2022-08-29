import 'package:flutter/material.dart';

import '../components/detail/detail_header.dart';
import '../components/detail_appbar.dart';
import '../components/option_item.dart';
import '../model/options.dart';
import '../utils/app_color.dart';

class CalBurnedScreen extends StatelessWidget {
  CalBurnedScreen({Key? key}) : super(key: key);

  goBack(BuildContext context) {
    Navigator.pop(context);
  }

  final item = [
    Options(label: "257", sublabel: "Cals", unit: "July 01"),
    Options(label: "563", sublabel: "Cals", unit: "July 05"),
    Options(label: "684", sublabel: "Cals", unit: "July 06"),
    Options(label: "245", sublabel: "Cals", unit: "July 07"),
    Options(label: "852", sublabel: "Cals", unit: "July 08"),
    Options(label: "569", sublabel: "Cals", unit: "July 09"),
    Options(label: "456", sublabel: "Cals", unit: "July 10"),
    Options(label: "535", sublabel: "Cals", unit: "July 13"),
    Options(label: "886", sublabel: "Cals", unit: "July 14"),
    Options(label: "586", sublabel: "Cals", unit: "July 16"),
    Options(label: "423", sublabel: "Cals", unit: "July 17"),
    Options(label: "358", sublabel: "Cals", unit: "July 20"),
    Options(label: "785", sublabel: "Cals", unit: "July 21", last: true),
  ];

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: detailAppbar(
        "Cals Burned",
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
                Icons.electric_bolt_outlined,
                color: AppColors.orangeColor,
                size: 50,
              ),
              value: 12835,
              type: "Cals",
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
