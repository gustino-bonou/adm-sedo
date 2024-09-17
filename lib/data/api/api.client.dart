
import 'package:adms/utils/helper/import.app.path.dart';
import 'package:adms/utils/local_storage/get.storage.service.dart';

import '../../utils/constants/local.storage.constant.dart';

class ApiClient extends GetConnect implements GetxService {

  late Map<String, String> _mainHerders;

  final localStorageService = Get.find<StorageService>();


  ApiClient(){
    baseUrl = ApiConstant.BASE_URL;
    timeout = const Duration(seconds: 30);
  }

  Future<void> _initializeHeaders() async {
    final token = await localStorageService.getString(LocalStorageConstant.token);
    _mainHerders = {
      'Content-type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token',
    };
  }

  Future<Response> getFrom(String uri) async {
    await _initializeHeaders();
    try {
      final response = await get(
        uri,
        headers: _mainHerders,
      );

      // final request = value.request!;
      // print("ooo");
      // print("Request URL: ${request.url}");
      // print("Request Method: ${request.method}");
      // print("Request Headers: ${request.headers}");
      // print("Request Body: ${request.bodyBytes}");
      //
      // // Debugging information for the response
      // print("Response Status Code: ${value.statusCode}");
      // print("Response Body: ${response.body}");
      // print("Response Request: ${response.request}");
      // print("Response status text: ${response.statusText}");

      return response;
    } catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }

  Future<Response> postFrom(String uri, dynamic data) async {

    await _initializeHeaders();
    try {
      final response = await post(
        uri,
        data,
        headers: _mainHerders,
      );
      // print("ooo");
      // print("Request URL: ${request.url}");
      // print("Request Method: ${request.method}");
      // print("Request Headers: ${request.headers}");
      // print("Request Body: ${request.bodyBytes}");
      //
      // // Debugging information for the response
      // print("Response Status Code: ${value.statusCode}");
      // print("Response Body: ${response.body}");
      // print("Response Request: ${response.request}");
      // print("Response status text: ${response.statusText}");
      return response;
    } catch (e) {
      print(e.toString());
      return Response(statusCode: 1, statusText: e.toString());
    }
  }
}
