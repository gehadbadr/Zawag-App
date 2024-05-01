import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
GetStorage storage = GetStorage();
Dio dio() {
  Dio dio = Dio();
  dio.options.baseUrl = "https://analyzes.online/effah/effah/public/api/";
  dio.options.headers = {
   'content-type': 'application/json',
    "Accept-Encoding": "gzip",
    "Accept": "application/x-www-form-urlencoded",
    'authorization': 'Bearer ${storage.read("token")}',
     };
  dio.options.receiveDataWhenStatusError = true;
  dio.options.followRedirects = true;
  dio.options.validateStatus = (state){return state! < 500;};
  dio.options.connectTimeout = const Duration(seconds: 30);
  dio.options.receiveTimeout = const Duration(seconds: 30);
  return dio;
}
class ApiConstants {
  static const baseUrl = 'https://analyzes.online/effah/effah/public/api/';
  static const imagebaseUrl = 'https://analyzes.online/effah/effah/public/api/';

}
