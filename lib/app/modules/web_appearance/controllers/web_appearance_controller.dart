import 'dart:io';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

class WebAppearanceController extends GetxController {
  //save pdf file to local storage and open it
  Future<String> saveAndLaunchFile() async {
    final url = Uri.parse(Get.arguments.toString());
    final filename = url.pathSegments.last;
    final response = await http.get(url);
    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/$filename');
    await file.writeAsBytes(response.bodyBytes);
    return file.path;
  }
}
