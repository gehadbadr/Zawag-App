import 'package:effa/helper/dio_helper.dart';
import 'package:effa/helper/http_exeption.dart';
import 'package:effa/models/user/user_auth_model.dart';
import 'package:effa/ui/screens/dashboard/male_dashboard.dart';
import 'package:effa/ui/screens/main_data/main_data.dart';
import 'package:effa/ui/screens/terms/trems.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:dio/dio.dart' as Dio;

class AuthController extends GetxController {
  bool loader = false;
  //register&login
  UserAuth? userAuth;
  List<String> options = ['getx', 'provider', 'bloc', 'mobx'];
  Rx<List<String>> selectedOptionList = Rx<List<String>>([]);
  var selectedOption = ''.obs;
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
          'phone': phone,
          // 'phone_code':countryCode,
          'user_code': userCode,
          "gender": 1,
        }),
      );
      print("register == ${response.data}");
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
        print("object== ${userAuth!.accessToken}");
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
      print("register error == ${error.toString()}");
      //  throw (error);
    }
  }

  //updateUser data
  Future<void> updateUser(
    String? about_you,
    String? about_partner,
  ) async {
    try {
      loader = true;
      update();
      Dio.Response response = await dio().post(
        'general/update_profile',
        data: Dio.FormData.fromMap({
          'about_partner': about_partner,
          'about_you': about_you,
          // "interests": interests,
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
        print("updateUser == ${response.data}");
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
      print("updateUser == ${error.toString()}");
      throw (error);
    }
  }
}
