import 'package:http/http.dart' as http;
import 'package:news_app_with_api/consts/strings.dart';

class Apiservices {
  Future<http.Response> getdata() async {
    String url = '$HeadlinesLink';
    print('API Request URL: $url');
    try {
      http.Response response = await http.get(Uri.parse(url));
      return response;
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }
}
