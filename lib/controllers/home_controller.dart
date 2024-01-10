import 'dart:convert';
import 'dart:ffi';
import 'dart:math';

import 'package:get/get.dart';
import 'package:news_app_with_api/Services/apiservices.dart';
import 'package:news_app_with_api/models/headlinenewsmodel.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  Apiservices apiservices = Apiservices();
  List<HeadlinesNewsModel> headlineNewsDataList = [];
  bool loading = false;

  Future<List<HeadlinesNewsModel>> headlinesNewsData() async {
    try {
      loading = true;

      http.Response data = await apiservices.getdata();

      print(data.statusCode.toString());
      if (data.statusCode == 200) {
        print(data.body);
        Map<String, dynamic> datalist = jsonDecode(data.body);
        headlineNewsDataList.add(HeadlinesNewsModel.fromJson(datalist));
        loading = false;
        print('HeadlinesNewsModel: ${headlineNewsDataList.toString()}');
      }
      return headlineNewsDataList;
    } catch (e, stackTrace) {
      loading = false;

      print('Error fetching data: $e');
      print('Stack Trace: $stackTrace');

      return headlineNewsDataList;
    }
  }
}
