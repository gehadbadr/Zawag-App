
import 'package:effa/helper/dio_helper.dart';
import 'package:effa/helper/http_exeption.dart';
import 'package:effa/models/nationality/nationality_model.dart';
import 'package:effa/models/user/user_auth_model.dart';
import 'package:effa/ui/screens/detailed%20_personal_data/detaild_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as Dio;


class BasicPagesController extends GetxController {
  UserAuth? userAuth;

  PageController pageController = PageController(initialPage: 0);

  TextEditingController searchController  = TextEditingController();

  double position = 0.20;

  bool isFemale = false;

  int choosenGender = 1;

  bool pressed = false;

  bool nationalPress = false;

  int tapIndex = 0;

  bool religionPress = false;

  int religionTapIndex = 0;

  List<String> demoList = ["كويتي", "يمني", "عراقي", "مصري", "سعودي"];

  List<String> religionList = [ "الاسلام","المسيحيه"];

  DateTime myDate = DateTime(2002);

  TextEditingController firstName = TextEditingController();

  TextEditingController secondName = TextEditingController();

  bool loader = false;

  bool loaderN = false;

  List<NationalityModel?>? nationalityModel;

  RxList found = [].obs;

  @override
  void onInit() {
    fetchNationalityData();
    // TODO: implement onInit
    super.onInit();
  }

  void onTap() {
    pageController.nextPage(
        duration: const Duration(milliseconds: 250), curve: Curves.bounceInOut);
    position += 0.20;
    update();
  }

  Future<bool> onPrevious() async {
    bool back = pageController.page == 0;
    if (!back) {
      await pageController.previousPage(
          duration: const Duration(milliseconds: 250),
          curve: Curves.bounceInOut);
      position -= 0.20;
      update();
    }
    return Future.value(back);
  }

  choseNational(int i, bool val) {
    tapIndex = i;
    nationalPress = val;
    update();
  }

  choseReligion(int i, bool val) {
    religionTapIndex = i;
    religionPress = val;
    update();
    updateUser();
  }

  choseGender(bool gender, int idGen) {
    pressed = true;
    isFemale = gender;
    choosenGender = idGen;
    onTap();
    update();
  }

  //updateUser data
  Future<void> updateUser() async {
    try {
      loader = true;
      update();
      Dio.Response response = await dio().post(
        'general/update_profile',
        data: Dio.FormData.fromMap({
          'gender': choosenGender,
          'frName': firstName.text,
          'lsName': secondName.text,
          'birth_date': myDate.toString(),
          'country_id': 1,
          'religion_id': religionTapIndex + 1,
        }),
      );
      if (response.statusCode != 200) {
        loader = false;
        update();
        throw HttpExeption(response.data['errors'] == "user code not correct" ?
        "كود المستخدم غير صحيح"
            : "");
      }
      if (response.statusCode == 200) {
        storage.write(
          'gender',
          choosenGender,
        );
        loader = false;
        Get.offAll(() => DetailedInfo(showEdit: false,),);
        update();
      }
    } on HttpExeption catch (e) {
      loader = false;
      update();
      Get.snackbar(e.message, "حاول مره اخري !",
          borderRadius: 0,
          showProgressIndicator: false, duration: const Duration(seconds: 4));
    }
    catch (error) {
      Get.snackbar(error.toString(), "حاول مره اخري !",
          borderRadius: 0,
          showProgressIndicator: false, duration: const Duration(seconds: 4));
      throw (error);
    }
  }

  //fetchNationality
  Future <List<NationalityModel?>?> fetchNationalityData() async {
    try {
      loaderN = true;
      final Dio.Response response = await dio().get(
         'general/nationality',
      );

      final jsonList = response.data as List;
      nationalityModel = jsonList.map((json) => NationalityModel.fromJson(json)).toList();
      found.value = nationalityModel!;
      loaderN = false;
      update();
    } catch (err) {
      loaderN = false;
      update();
      print(err);
      // ignore: unnecessary_brace_in_string_interps
    }
    return nationalityModel;
  }

  //searchMethod
  void filterNationality(String playerName) {
    List<NationalityModel?>? results = [];
    if (playerName.isEmpty) {
      results = nationalityModel;
    } else {
      if(choosenGender == 1){
        results = nationalityModel!
            .where((element) {
          return element!.name
              .toString()
              .toLowerCase()
              .contains(playerName.toLowerCase());})
            .toList();
      }else{
        results = nationalityModel!
            .where((element) {
          return element!.fName
              .toString()
              .toLowerCase()
              .contains(playerName.toLowerCase());})
            .toList();
      }

    }
    found.value = results!;
  }
}
