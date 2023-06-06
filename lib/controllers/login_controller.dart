import 'package:effa/ui/screens/pin_page/pin_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController{
  String countryName = "";
  String countryCode = "+20";
  CountryCode? myCode;
  bool checkNum = false;
  bool loader = false;
  TextEditingController phoneController = TextEditingController();
  final controllerr = TextEditingController();
  final countryPicker = const FlCountryCodePicker(
    favorites: ['EG', 'JO', 'IQ', 'LY', 'QA', 'SE', 'SY', 'TN', 'PS', 'KW', 'YE', 'AE', 'SA', 'OM'],
  );
  choseCountry(BuildContext ctx)async{
    final code = await countryPicker.showPicker(
        context: ctx);
    if (code != null) {
      myCode = code;
      countryName = code.name;
      countryCode = code.dialCode;
      update();

    }
  }
  setNum(){
    checkNum = true;
    update();
  }

  @override
  void onClose() {
    controllerr.dispose();
    // TODO: implement onClose
    super.onClose();
  }
  Future<void> sendOTP() async {
    GetStorage storage = GetStorage();
    loader = true;
    update();
    String phoneNumber = countryCode+controllerr.text;
    FirebaseAuth auth = FirebaseAuth.instance;
    // Force reCAPTCHA flo
    await auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) {
        // Auto-retrieve the SMS code and sign in the user
        auth.signInWithCredential(credential);
      },
      verificationFailed: (FirebaseAuthException e) {
        // Handle verification failed
      },
      codeSent: (String verificationId, int? resendToken)async {
        await storage.write("verificationId", verificationId);
        await storage.write("resendToken", resendToken);

        // Save the verification ID to use later
        // You can also use the resendToken to send another SMS
        // with the same verification ID
        // String smsCode = "";
        loader = false;
        update();
        Get.to(()=> PinPage(code: countryCode,myPhone: controllerr.text),);
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        // Handle timeout
      },
    );
  }
}