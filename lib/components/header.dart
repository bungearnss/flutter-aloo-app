import 'package:flutter/material.dart';

import '../utils/app_color.dart';

// ignore: must_be_immutable
class Header extends StatelessWidget {
  Widget child;
  Function()? onPressed;
  bool? isActivity;

  Header(
      {Key? key, required this.child, this.isActivity, required this.onPressed})
      : super(key: key);

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: 100,
          height: 230,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                enableFeedback: false,
                color: AppColors.greyColor,
                iconSize: 40,
                icon: const Icon(
                  Icons.menu_rounded,
                ),
                onPressed: onPressed,
              ),
              isActivity == true
                  ? Container()
                  : Container(
                      height: 90,
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: Image.asset(
                        "assets/logo.png",
                        fit: BoxFit.fitHeight,
                      ),
                    ),
            ],
          ),
        ),
        Container(
          width: width - 100,
          height: 230,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(25),
            ),
            color: AppColors.primaryColor,
          ),
          child: child,
        ),
      ],
    );
  }
}
