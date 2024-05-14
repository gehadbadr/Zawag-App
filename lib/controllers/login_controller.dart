// ignore_for_file: unused_local_variable

import 'package:country_picker/country_picker.dart';
import 'package:effa/helper/app_colors.dart';
import 'package:effa/ui/screens/pin_page/pin_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginController extends GetxController {
  String countryName = "";
  String countryCode = "+20";
  bool checkNum = false;
  bool loader = false;
  String? countrdyCode;
  TextEditingController phoneController = TextEditingController();
  final controllerr = TextEditingController();
  final countryPicker = const FlCountryCodePicker(
    favorites: [
      'EG',
      'JO',
      'IQ',
      'LY',
      'QA',
      'SE',
      'SY',
      'TN',
      'PS',
      'KW',
      'YE',
      'AE',
      'SA',
      'OM'
    ],
  );
  choseCountry(BuildContext ctx) async {
    showCountryPicker(
      useSafeArea: true,

      countryListTheme: CountryListThemeData(
        textStyle: GoogleFonts.cairo(),
        searchTextStyle: GoogleFonts.cairo(),
        bottomSheetHeight: 600.h,
        inputDecoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 6.h),
          isDense: true,
          hintText: "بحث",
          prefixIcon: const Icon(Icons.search),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: const Color(0xFF8C98A8).withOpacity(0.2),
            ),
          ),
        ),
      ),

      favorite: [
        'EG',
        'JO',
        'IQ',
        'LY',
        'QA',
        'SE',
        'SY',
        'TN',
        'PS',
        'KW',
        'YE',
        'AE',
        'SA',
        'OM'
      ],
      context: ctx,
      showPhoneCode:
          true, // optional. Shows phone code before the country name.
      onSelect: (Country country) {
        countryName = country.nameLocalized!;
        countryCode = "+${country.phoneCode}";
        countrdyCode = country.flagEmoji;
        update();
      },
    );
  }

  setNum() {
    checkNum = true;
    update();
  }

  @override
  void onClose() {
    controllerr.dispose();
    super.onClose();
  }

  Future<void> withoutsendOTP() async {
    GetStorage storage = GetStorage();
    loader = true;
    update();
    if (controllerr.text.startsWith("0") && countryCode == ("+20")) {
      controllerr.text = controllerr.text.replaceFirst(RegExp('^0'), '');
    }
    String phoneNumber = countryCode + controllerr.text;
    //      await storage.write("verificationId", verificationId);
    await storage.write("resendToken", "123456789");

    // Save the verification ID to use later
    // You can also use the resendToken to send another SMS
    // with the same verification ID
    // String smsCode = "";
    loader = false;
    update();
    Get.to(
      () => PinPage(code: countryCode, myPhone: controllerr.text),
    );
    FirebaseAuth auth = FirebaseAuth.instance;
    // Force reCAPTCHA flo
    // await auth.verifyPhoneNumber(
    //   phoneNumber: phoneNumber,
    //   verificationCompleted: (PhoneAuthCredential credential) {
    //     // Auto-retrieve the SMS code and sign in the user
    //     auth.signInWithCredential(credential);
    //   },
    //   verificationFailed: (FirebaseAuthException e) {
    //     loader = false;
    //     update();
    //     switch (e.code) {
    //       case "invalid-verification-id":
    //         Get.snackbar('خطاء في id', e.code.toString(),
    //             borderRadius: 0,
    //             snackPosition: SnackPosition.BOTTOM);
    //         loader = false;
    //         update();
    //         break;

    //       case "invalid-verification-code":
    //         Get.snackbar('فشل التحقق من الكود', e.code.toString(),
    //             borderRadius: 0,
    //             snackPosition: SnackPosition.BOTTOM);
    //         loader = false;
    //         update();
    //         break;

    //       case "invalid-phone-number":
    //         Get.snackbar('رقم الهاتف الذي أدخلته غير صحيح', e.code.toString(),
    //             backgroundColor: Colors.red,
    //             borderRadius: 0,
    //             snackPosition: SnackPosition.BOTTOM);
    //         break;

    //       case "session-expired":
    //         Get.snackbar('من فضلك اضغط اعادة ارسال الكود وأدخل الكود الجديد', e.code.toString(),
    //           borderRadius: 0,
    //           snackPosition: SnackPosition.BOTTOM,

    //         );

    //         loader = false;
    //         update();
    //         break;
    //     }
    //     // Handle verification failed
    //   },
    //   codeSent: (String verificationId, int? resendToken)async {
    //     await storage.write("verificationId", verificationId);
    //     await storage.write("resendToken", resendToken);

    //     // Save the verification ID to use later
    //     // You can also use the resendToken to send another SMS
    //     // with the same verification ID
    //     // String smsCode = "";
    //     loader = false;
    //     update();
    //     Get.to(()=> PinPage(code: countryCode,myPhone: controllerr.text),);
    //   },
    //   codeAutoRetrievalTimeout: (String verificationId) {
    //     // Handle timeout
    //   },
    // );
  }

  Future<void> sendOTP() async {
    GetStorage storage = GetStorage();
    loader = true;
    update();
    if(controllerr.text.startsWith("0")&&countryCode ==("+20")){
      controllerr.text = controllerr.text.replaceFirst(RegExp('^0'), '');
    }
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
        loader = false;
        update();
        switch (e.code) {
          case "invalid-verification-id":
            Get.snackbar('خطاء في id', e.code.toString(),
                borderRadius: 0,
                snackPosition: SnackPosition.BOTTOM);
            loader = false;
            update();
            break;

          case "invalid-verification-code":
            Get.snackbar('فشل التحقق من الكود', e.code.toString(),
                borderRadius: 0,
                snackPosition: SnackPosition.BOTTOM);
            loader = false;
            update();
            break;

            case "invalid-phone-number":
              Get.snackbar('رقم الهاتف الذي أدخلته غير صحيح', e.code.toString(),
                  backgroundColor: Colors.red,
                  borderRadius: 0,
                  snackPosition: SnackPosition.BOTTOM);
              break;

          case "session-expired":
            Get.snackbar('من فضلك اضغط اعادة ارسال الكود وأدخل الكود الجديد', e.code.toString(),
              borderRadius: 0,
              snackPosition: SnackPosition.BOTTOM,

            );

            loader = false;
            update();
            break;
          default:
            print("error login ==${e.message}");
        }
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
