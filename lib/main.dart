import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_aloo_app/utils/app_color.dart';
import 'package:google_fonts/google_fonts.dart';

import './screen/home_screen.dart';
import './screen/navigator_screen.dart';

import './providers/screen_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: ScreenController(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          textTheme: TextTheme(
            headline1: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            bodyText1: GoogleFonts.poppins(
              fontSize: 10,
              color: AppColors.greyColor,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        home: const SafeArea(
          child: NavigatorScreen(),
        ),
      ),
    );
  }
}
