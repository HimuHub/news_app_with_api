import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app_with_api/controllers/splash_controller.dart';

class Splashscreen extends StatelessWidget {
  const Splashscreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height * 1;
    final width = MediaQuery.sizeOf(context).width * 1;
    SplashController splashController = Get.put(SplashController());
    return Scaffold(
      backgroundColor: Color(0xFFf2f2f6),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'images/splash_pic.jpg',
              height: height * .5,
              fit: BoxFit.scaleDown,
            ),
            SizedBox(
              height: height * .04,
            ),
            Text(
              'Top Headlines',
              style: GoogleFonts.anton(
                  color: Colors.grey.shade700, letterSpacing: .6),
            ),
            SizedBox(
              height: height * .04,
            ),
            SpinKitPouringHourGlassRefined(
              color: Colors.lightBlue,
              size: 50,
            )
          ],
        ),
      ),
    );
  }
}
