import 'dart:async';
import 'package:get/get.dart';
import 'package:news_app_with_api/ui/homescreen.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();

    Timer(Duration(seconds: 3), () {
      Get.off(() => HomeScreen());
    });
  }
}
