import 'dart:async';

import 'package:effa/helper/app_colors.dart';
import 'package:effa/models/posts/auth.dart';
import 'package:effa/ui/screens/terms/trems.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:quiver/async.dart';

class PinCodeController extends GetxController {
  AuthController authController = Get.put(AuthController(), permanent: false);
  bool loader = false;
  final _remainingTime = 0.obs;
  StreamSubscription<CountdownTimer>? timerr;

  int get remainingTime => _remainingTime.value;

  void startCountdown(int seconds) {
    timerr?.cancel();
    timerr =
        CountdownTimer(Duration(seconds: seconds), const Duration(seconds: 1))
            .listen((timer) {
      _remainingTime.value = timer.remaining.inSeconds;
      if (timer.remaining.inSeconds == 0) {
        timerr?.cancel();
      }
    });
  }

  @override
  void onInit() {
    startCountdown(120);
    // TODO: implement onInit
    super.onInit();
  }

  TextEditingController codeController1 = TextEditingController();
  TextEditingController codeController2 = TextEditingController();
  TextEditingController codeController3 = TextEditingController();
  TextEditingController codeController4 = TextEditingController();
  TextEditingController codeController5 = TextEditingController();
  TextEditingController codeController6 = TextEditingController();

  FocusNode focusDigit1 = FocusNode();
  FocusNode focusDigit2 = FocusNode();
  FocusNode focusDigit3 = FocusNode();
  FocusNode focusDigit4 = FocusNode();
  FocusNode focusDigit5 = FocusNode();
  FocusNode focusDigit6 = FocusNode();

  @override
  void onClose() {
    focusDigit1.dispose();
    focusDigit2.dispose();
    focusDigit3.dispose();
    focusDigit4.dispose();
    focusDigit5.dispose();
    focusDigit6.dispose();
    timerr?.cancel();
    // TODO: implement onClose
    super.onClose();
  }

  Future<void> sendOTPCode(
      BuildContext ctx, String? myPhone, String? code) async {
    GetStorage storage = GetStorage();
    FirebaseAuth auth = FirebaseAuth.instance;
    var codetest = storage.read("verificationId");
    print("===========${codetest}");
    loader = true;
    update();
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: storage.read("verificationId"),
        smsCode: codeController1.text +
            codeController2.text +
            codeController3.text +
            codeController4.text +
            codeController5.text +
            codeController6.text);
    try {
      await auth.signInWithCredential(credential);
      print("========verificationId===${codetest}");

      String tokenResult = FirebaseAuth.instance.currentUser!.uid;
      print("========tokenResult===${tokenResult}");

      await authController.register(myPhone!, code!,tokenResult);
      loader = false;
      update();
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "invalid-verification-id":
          Get.snackbar('خطاء في id', e.code.toString(),
              borderRadius: 0, snackPosition: SnackPosition.BOTTOM);
          loader = false;
          update();
          break;

        case "invalid-verification-code":
          Get.snackbar('فشل التحقق من الكود', e.code.toString(),
              borderRadius: 0, snackPosition: SnackPosition.BOTTOM);
          loader = false;
          update();
          break;

        case "invalid-phone-number":
          Get.snackbar('رقم الهاتف الذي أدخلته غير صحيح', e.code.toString(),
              borderRadius: 0, snackPosition: SnackPosition.BOTTOM);
          break;

        case "session-expired":
          Get.snackbar(
            'من فضلك اضغط اعادة ارسال الكود وأدخل الكود الجديد',
            e.code.toString(),
            borderRadius: 0,
            snackPosition: SnackPosition.BOTTOM,
          );

          loader = false;
          update();
          break;
      }
    } catch (e) {
      Get.snackbar(e.toString(), "nbvmbvmbnvmnbخطاء",
          borderRadius: 0, snackPosition: SnackPosition.BOTTOM);
      loader = false;
      print(codetest);

      update();
    }
  }
}
