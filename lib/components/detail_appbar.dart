import 'package:flutter/material.dart';

import '../utils/app_color.dart';

PreferredSize? detailAppbar(
    String title, BuildContext context, void Function()? goBack) {
  return PreferredSize(
      preferredSize: Size.fromHeight(60),
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.only(left: 15, top: 50),
        child: Row(
          children: [
            GestureDetector(
              onTap: goBack,
              child: const Icon(
                Icons.chevron_left_rounded,
                color: AppColors.greyColor,
                size: 30,
              ),
            ),
            const SizedBox(width: 5),
            Text(
              title,
              style: Theme.of(context).textTheme.headline1,
            )
          ],
        ),
      ));
}
