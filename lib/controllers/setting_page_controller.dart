import 'package:get/get.dart';
import 'package:effa/models/terms/terms.dart';
import 'package:dio/dio.dart' as Dio;
import 'package:effa/helper/dio_helper.dart';

class SettingPageController extends GetxController {
  bool isSwitched = false;
  bool loader = false;
  TermsModel? aboutModel;
  ShareLinkModel? shareLinkModel;
  SocialsLinkModel? socialsLinkModel;
  void onInit() {
    fetchAboutData();
    // TODO: implement onInit
    super.onInit();
  }

  void toggleSwitch(bool value) {
    if (isSwitched == false) {
      isSwitched = true;
      update();
    } else {
      isSwitched = false;
      update();
    }
  }

  Future<TermsModel?> fetchAboutData() async {
    try {
      loader = true;

      Dio.Response response = await dio().get(
        'about',
      );
      Dio.Response responseLink = await dio().get(
        'share_link',
      );
      Dio.Response responseSocials = await dio().get(
        'socials',
      );
      print("fetchAboutData == ${response.data}");
      aboutModel = TermsModelFromJson(response.toString());
      shareLinkModel = shareLinkModelFromJson(responseLink.toString());
      socialsLinkModel =
          SocialsLinkModel.fromJson(responseSocials as Map<String, dynamic>);
      print("responseSocials===${responseSocials.data}");
      loader = false;
      update();

      return TermsModelFromJson(response.toString());
    } catch (err) {
      loader = false;
      update();

      print("fetchAboutData error == ${err}");
      // ignore: unnecessary_brace_in_string_interps
    }
    return aboutModel;
  }
}
