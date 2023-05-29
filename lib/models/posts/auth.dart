import 'dart:convert';

import 'package:effa/helper/dio_helper.dart';
import 'package:effa/helper/http_exeption.dart';
import 'package:effa/models/user/user_auth_model.dart';
import 'package:effa/ui/screens/dashboard/male_dashboard.dart';
import 'package:effa/ui/screens/detailed%20_personal_data/detaild_data.dart';
import 'package:effa/ui/screens/main_data/main_data.dart';
import 'package:effa/ui/screens/terms/trems.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:dio/dio.dart' as Dio;
class AuthController extends GetxController{
  //register&login
  UserAuth? userAuth;
  Future<void> register(
      String phone,
      String countryCode,
      String userCode,
      ) async {
    GetStorage storage = GetStorage();
    try {
      Dio.Response response = await dio().post(
        'register',
        data: Dio.FormData.fromMap({
          'phone':phone,
          'phone_code':countryCode,
          'user_code':userCode,
        }),
      );
      print(response.data);
      if (response.statusCode != 200) {
        throw HttpExeption(response.data['errors']=="user code not correct"?
             "كود المستخدم غير صحيح"
            :"");
      }
      if (response.statusCode == 200) {
        userAuth = UserAuthFromJson(response.toString());
        storage.write(
          'token',
          userAuth!.accessToken,
        );
        storage.write(
          'user_id',
          userAuth!.user.id,
        );
        if(userAuth!.user.isComplet == 1){
          print("is_complet");
          Get.offAll(() =>DashBoardMale());
        }else if(userAuth!.user.isNew == 1){
          print("is_complet_true");
          Get.offAll(() =>Terms());
        }else if(userAuth!.user.isNew == 0){
          print("is_complet_false");
          if(userAuth!.user.isAcceptTerms == 1){
          Get.offAll(() =>MainData());}
          else if(userAuth!.user.isAcceptTerms == 0){
            print("is_accept_terms_false");
            Get.offAll(() =>Terms());
          }
        }
      }
    } on HttpExeption catch (e) {
      Get.snackbar(e.message,"حاول مره اخري !",
          showProgressIndicator: false, duration: const Duration(seconds: 4));
    }
    catch (error) {
      print(error);
      throw (error);
    }
  }
}