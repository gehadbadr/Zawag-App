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

class AuthController extends GetxController {
  bool loader = false;
  //register&login
  UserAuth? userAuth;
  Future<void> testregister(
  /*  String phone,
    //  String countryCode,
    String userCode,*/
  ) async {
   // int phoneInt = int.parse(phone);
    GetStorage storage = GetStorage();
    try {
      Dio.Response response = await dio().post(
        'register',
        data: Dio.FormData.fromMap({
          // 'phone': 123456789,
          // // 'phone_code':countryCode,
          // 'user_code': 541515,
          "id": 8,
    "frName": "جهاد",
    "lsName": null,
    "FaName": null,
    "idNumber": null,
    "image": null,
    "is_login": 1,
    "is_complet": 0,
    "gender": 1,
    "is_block": 1,
    "is_wait": 0,
    "phone_Code": "+20",
    "phone": "43456576",
    "user_code": "123",
    "country_id": null,
    "country": null,
    "is_new": 0,
    "gov_id": null,
    "city_id": null,
    "lastLoginAt": null,
    "religion_id": 1,
    "birth_date": null,
    "slug": "ME5002837",
    "identity_face": null,
    "identity_back": null,
    "passport_image": null,
    "is_approved": 0,
    "reject_resson": null,
    "about_you": null,
    "is_accept_terms": 1,
    "about_partner": null,
    "created_at": "2022-11-30T07:35:55.000000Z",
    "updated_at": "2023-05-18T20:04:46.000000Z",
    "full_name": "محمد "
        }),
      );
      print(response.data);
      if (response.statusCode != 200) {
        throw HttpExeption(response.data['errors'] == "user code not correct"
            ? "كود المستخدم غير صحيح"
            : "");
      }
      if (response.statusCode == 200) {
        userAuth = UserAuthFromJson(response.toString());
        storage.write(
          'token',
          userAuth!.accessToken,
        );
        print("{ object======= ${userAuth!.accessToken}");
        storage.write(
          'user_id',
          userAuth!.user?.id,
        );
        storage.write(
          'gender',
          userAuth!.user?.gender,
        );
        if (userAuth!.user?.isComplet == 1) {
          print("is_complet");
          Get.offAll(() => DashBoardMale());
        } else if (userAuth!.user?.isNew == 1) {
          print("is_complet_true");
          Get.offAll(() => Terms());
        } else if (userAuth!.user?.isNew == 0) {
          print("is_complet_false");
          if (userAuth!.user?.isAcceptTerms == 1) {
            Get.offAll(() => MainData());
          } else if (userAuth!.user?.isAcceptTerms == 0) {
            print("is_accept_terms_false");
            Get.offAll(() => Terms());
          }
        }
      }
    } on HttpExeption catch (e) {
      Get.snackbar(e.message, "حاول مره اخري !",
          borderRadius: 0,
          showProgressIndicator: false,
          duration: const Duration(seconds: 4));
    } catch (error) {
       print(error);
       throw (error);
    }
  }

  Future<void> register(
    String phone,
    //  String countryCode,
    String userCode,
  ) async {
    GetStorage storage = GetStorage();
    try {
      Dio.Response response = await dio().post(
        'register',
        data: Dio.FormData.fromMap({
          'phone': phone,
          // 'phone_code':countryCode,
          'user_code': userCode,
          
        }),
      );
      print(response.data);
      if (response.statusCode != 200) {
        throw HttpExeption(response.data['errors'] == "user code not correct"
            ? "كود المستخدم غير صحيح"
            : "");
      }
      if (response.statusCode == 200) {
        userAuth = UserAuthFromJson(response.toString());
        storage.write(
          'token',
          userAuth!.accessToken,
        );
        print("object${userAuth!.accessToken}");
        storage.write(
          'user_id',
          userAuth!.user?.id,
        );
        storage.write(
          'gender',
          userAuth!.user?.gender,
        );
        if (userAuth!.user?.isComplet == 1) {
          print("is_complet");
          Get.offAll(() => DashBoardMale());
        } else if (userAuth!.user?.isNew == 1) {
          print("is_complet_true");
          Get.offAll(() => Terms());
        } else if (userAuth!.user?.isNew == 0) {
          print("is_complet_false");
          if (userAuth!.user?.isAcceptTerms == 1) {
            Get.offAll(() => MainData());
          } else if (userAuth!.user?.isAcceptTerms == 0) {
            print("is_accept_terms_false");
            Get.offAll(() => Terms());
          }
        }
      }
    } on HttpExeption catch (e) {
      Get.snackbar(e.message, "حاول مره اخري !",
          borderRadius: 0,
          showProgressIndicator: false,
          duration: const Duration(seconds: 4));
    } catch (error) {
      print(error);
      //  throw (error);
    }
  }

  //updateUser data
  Future<void> updateUser(String? about_you, String? about_partner) async {
    try {
      loader = true;
      update();
      Dio.Response response = await dio().post(
        'general/update_profile',
        data: Dio.FormData.fromMap({
          'about_partner': about_you,
          'about_you': about_you,
        }),
      );
      if (response.statusCode != 200) {
        loader = false;
        update();
        throw HttpExeption(response.data['errors'] == "user code not correct"
            ? "كود المستخدم غير صحيح"
            : "");
      }
      if (response.statusCode == 200) {
        loader = false;
        print(response.data);
        Get.back();
        update();
      }
    } on HttpExeption catch (e) {
      loader = false;
      update();
      Get.snackbar(e.message, "حاول مره اخري !",
          borderRadius: 0,
          showProgressIndicator: false,
          duration: const Duration(seconds: 4));
    } catch (error) {
      Get.snackbar(error.toString(), "حاول مره اخري !",
          borderRadius: 0,
          showProgressIndicator: false,
          duration: const Duration(seconds: 4));
      throw (error);
    }
  }
}
