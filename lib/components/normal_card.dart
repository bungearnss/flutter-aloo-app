import 'package:flutter/material.dart';

import '../utils/app_color.dart';

class NormalCard extends StatelessWidget {
  Widget child;
  NormalCard({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            const EdgeInsets.only(left: 18, right: 18, top: 25, bottom: 25),
        child: child,
      ),
    );
  }
}
