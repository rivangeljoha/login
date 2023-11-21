import 'package:get/get.dart';

import 'package:http/http.dart' as http;

class AreaProvider extends GetxController {
  Future<void> getAllAreas() async {
    String url = 'http://localhost:8000/api/areas/';
    http.MultipartRequest request =
        http.MultipartRequest('GET', Uri.parse(url));
  }
}
