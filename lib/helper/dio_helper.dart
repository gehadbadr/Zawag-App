import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
GetStorage storage = GetStorage();
Dio dio() {
  Dio dio = Dio();
  dio.options.baseUrl = "https://elshakhs.net/effah/public/api/";
  dio.options.headers = {
   'content-type': 'application/json',
    "Accept-Encoding": "gzip",
    "Accept": "application/x-www-form-urlencoded",
    'authorization': 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiZDI2OGRjYWYxMWQwYmRiYWUyY2JjOWIzNjEwNTUzZTA5NzgwZmMyODAxNTNlMDdlMmY3MTc4ZWY2ZDkxNDRkZWViZjA1NmExZjMyNmZiYzciLCJpYXQiOjE2ODQ4ODA1MzUuMDIzNjQxMTA5NDY2NTUyNzM0Mzc1LCJuYmYiOjE2ODQ4ODA1MzUuMDIzNjQ0OTI0MTYzODE4MzU5Mzc1LCJleHAiOjE3MTY1MDI5MzUuMDE5NzI2OTkxNjUzNDQyMzgyODEyNSwic3ViIjoiMjMiLCJzY29wZXMiOltdfQ.eFPtpSrOhF3XFwtJ2P31c7jNag0aY9sH3xug7tPEKf7nfnWsO30hXdxSgWjwgMs8E9YwxviiO8mdpcu93lSk5X6ooY3Gm65H5KL_Jro1y4fPKZmjFbwYJlDGa7-n5JQmQJlFMPLswm9ggGlENY2nJli8RI3QDX0zZZUSLBJEOkwoC0uskXQzDlJaRTnSKgS7ftDr25zdN5mKIZMniFEUpUMJNYnbLmb1IlZqwZAWQUmkZMSJg-Wrdg4BAfmx8lNrukcuXQyFJ7CkUqwOgfU5x0m-jxP0468PqbIe77uGen86tHdYy9xLvGxD1WE2cnqAfDcHer6wwNSYxenbxgQJ3H6FPO30fJkmtGAYHSoPbMll17BL6ZZuuxRw-YhFd5por5AEFC5CtrWmhGCh51BAXh-DEzNzAL8oY0dbMy0zscnkUCoD209jpSd4NhdZfZZLAjtqv6b_qGhUCBb7N2KuMpwfyqNFqROM5FCX-yBPBARYrLnmDyUW1VZKD6XZu8jRkaLOen1Jl0E5g7sXWGnAOe--cfeVLAgIAFfaen-_93Q5dxLsvBmg1FqJdFBXD8czrF-EJeSuN3bEyly80H0zdOFXyZOPXV76MKqtoGF4I3BQiURKwlzoYnO32QOcZeNluEv6pAgR12Fzma0AQrNnQvJFRuccW8rEw5XwnsSb7lA',
  };
  dio.options.receiveDataWhenStatusError = true;
  dio.options.followRedirects = true;
  dio.options.validateStatus = (state){return state! < 500;};
  dio.options.connectTimeout = const Duration(seconds: 30);
  dio.options.receiveTimeout = const Duration(seconds: 30);
  return dio;
}
class ApiConstants {
  static const baseUrl = 'https://elshakhs.net/effah/public/api/';
  static const imagebaseUrl = 'https://elshakhs.net/effah/public/api/';

}
