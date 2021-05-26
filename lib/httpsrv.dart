import 'package:dio/dio.dart';

Future<List> getadslist() async {
  try {
    var response = await Dio().get('http://127.0.0.1:9999/api/v1/ads/');
    return response.data;
  } catch (e) {
    print(e);
  }
}

Future<List> getabrlink(addr) async {
  try {
    var response = await Dio().get(addr);
    return response.data;
  } catch (e) {
    print(e);
  }
}

