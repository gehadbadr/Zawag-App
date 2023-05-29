import 'package:effa/helper/dio_helper.dart';
import 'package:effa/models/terms/terms.dart';
import 'package:effa/ui/screens/main_data/main_data.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart'as Dio;
class TermsController extends GetxController{
  TermsModel? termsModel;

  bool loader = false;

  bool agree = false;

  bool posted = false;

  changeValue(bool val){
    agree = val;
    update();
  }
  @override
  void onInit() {
    fetchTermData();
    // TODO: implement onInit
    super.onInit();
  }
  Future <TermsModel?> fetchTermData() async {
    try {
      loader = true;

      Dio.Response response = await dio().get(
        'terms',
      );
      print(response.data);
      termsModel = TermsModelFromJson(response.toString());
      loader = false;
      update();

      return TermsModelFromJson(response.toString());
    } catch (err) {
      loader = false;
      update();

      print(err);
      // ignore: unnecessary_brace_in_string_interps
    }
    return termsModel;
  }
  Future<void> updateTerms() async {
    Map<String,dynamic> api ={
      "is_accept_terms": 1,
    };
    try {
      posted =true;
      update();
      Dio.Response response = await dio().post(
        'general/update_profile',
        data: Dio.FormData.fromMap(api),
      );
      if(response.statusCode == 200){
        posted =false;
        update();
        Get.to(() =>MainData());
      }
    } catch (error) {
      posted =false;
      print(error);
      throw (error);
    }
  }
}