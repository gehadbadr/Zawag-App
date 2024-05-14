import 'package:dio/dio.dart';
import 'package:effa/functions/checkInternet.dart';
import 'package:effa/helper/dio_helper.dart';
import 'package:effa/helper/http_exeption.dart';
import 'package:effa/models/questions/questions.dart';
import 'package:effa/models/user/user_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as Dio;

class QuestionsController extends GetxController {
  bool loader = false;
  bool loaderAnswer = false;

  QuestionsAndAnswers? questions;

  PageController pageController = PageController(initialPage: 0);

  double position = 0.0;

  int? tapIndex;

  int? selectedChoice;

  TextEditingController txtController = TextEditingController();

  TextEditingController txtAnswerController = TextEditingController();
  UserInfooo? user;
  bool press = false;
  bool listBool = false;

  int len = 0;

  int pageIndex = 0;
  int? categoryId;
  int level = 1;
  int lastId = 0;
  int completeCheched = 0;
  List<bool> checklist = [];

  List<int> idList = [];

  @override
  void onInit() async {
    final Dio.Response response = await dio().get(
      'myData',
    );
    user = UserInfooo.fromJson(response.data);
    
    super.onInit();
  }

  void fillList(List<Answer>? answers) {
    checklist = List<bool>.filled(answers!.length, listBool);
  }

  void addId(int id) {
    idList.add(id);
    print("addId== ${idList}");
  }

  void removeId(int i) {
    print(i);
    if (idList.isEmpty) {
      changeIndexnN();
    }
    idList.remove(i);
    print("removeId== ${idList}");
  }

  void resetValues() {
    Get.forceAppUpdate();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Wait for the PageView to be built before accessing the page property
      position = 0.0;
      tapIndex = 0;
      selectedChoice = null;
      pageIndex = 0;
      // pageController = PageController(initialPage: 0);
      update();
    });
  }

  void onPageChange(int i) {
    tapIndex = 0;
    selectedChoice = null;
    press = false;
    // pos = tapIndex-1;
    update();
  }

  void back() {
    pageIndex--;
    pageController.previousPage(
        duration: const Duration(milliseconds: 250), curve: Curves.easeIn);
    if (position != 1.0 - (1 / len)) {
      position -= 1 / len;
    }
    update();
  }

  void onTapP() {
    if (pageIndex + 1 != len) {
      pageIndex++;
      pageController.nextPage(
          duration: const Duration(milliseconds: 250),
          curve: Curves.bounceInOut);
      position += 1 / len;
    } else {
      level++;
      print('categories/get_questions/$categoryId/$level/$lastId');
      getQuestions();
      resetValues();
    }
    update();
  }

  void changeIndex(int i) {
    selectedChoice = i;
    press = true;
    tapIndex = i;

    update();
  }

  void updateList(int i, bool bool) {
    checklist[i] = bool;
    update();
  }

  void changeIndexnN() {
    selectedChoice = null;
    update();
  }

  //get questions
  Future<QuestionsAndAnswers?> getQuestions() async {
    var map;
    var res;
    res = await CheckInternet.checkInternet();
    if (res) {
      try {
        loader = true;
        update();
        final Dio.Response response = await dio().get(
          'categories/get_questions/$categoryId/$level/$lastId',
        );

        print(response.data);

      questions = QuestionsAndAnswers.fromJson(response.data);
      map = questions?.questions;
      len = map.toList().length;
      print(len);
      loader = false;
      update();
      if (len == 0) {
        Get.back();
        Get.snackbar("تم ارسال البيانات", "في انتظار المراجعه",
            borderRadius: 0,
            showProgressIndicator: false,
            duration: const Duration(seconds: 4));
      }
    } catch (err) {
      loader = false;
     // update();
      print("getQuestions error == ${err.toString()}");
      // ignore: unnecessary_brace_in_string_interps
    }
    return questions;
  }

  //post answers
  Future<void> singleAnswer(
    int qId,
    int answerId,
  ) async {
    var res;
    res = await CheckInternet.checkInternet();
    if (res) {
      try {
        lastId = qId;
        loaderAnswer = true;
        update();
        print("user_id------------------${user?.user?.id}");
        Dio.Response response = await dio().post(
          'questions/answer',
          // options: Options(
          //   followRedirects: false,
          //   validateStatus: (status) => true,
          // ),
          data: Dio.FormData.fromMap({
            'user_id': user?.user?.id,
            'que_id': qId,
            'one_choice': answerId,
          }),
        );
        print("object${response.statusMessage}");
        if (response.statusCode != 200) {
          loaderAnswer = false;
          update();
          throw HttpExeption(
              response.data['errors'] == "server error" ? "حاول مره اخري" : "");
        }
        if (response.statusCode == 200) {
          changeIndexnN();
          onTapP();
          loaderAnswer = false;
          update();
        }
      } on HttpExeption catch (e) {
        Get.snackbar(e.message, "حاول مره اخري !",
            borderRadius: 0,
            showProgressIndicator: false,
            duration: const Duration(seconds: 4));
      } catch (error) {
        loaderAnswer = false;
        update();
        print(error);
        throw (error);
      }
    } else {
      Get.snackbar('خطأ في الخدمه', "تحقق من الاتصال بالانترنت",
          backgroundColor: Colors.red,
          borderRadius: 0,
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  Future<void> multipleAnswer(
    int qId,
  ) async {
    try {
      Map<String, dynamic> api = {
                  'user_id': user?.user?.id,

        'que_id': qId,
      };
      for (int i = 0; i < idList.length; i++) {
        api['multiple_choice[$i]'] = idList[i];
      }
      Dio.Response response = await dio().post(
        'questions/answer',
        data: Dio.FormData.fromMap(api),
      );
      print("multipleAnswer == ${response.data}");
      if (response.statusCode != 200) {
        loaderAnswer = false;
        update();
        throw HttpExeption(
            response.data['errors'] == "server error" ? "حاول مره اخري" : "");
      }
      if (response.statusCode == 200) {
        changeIndexnN();
        onTapP();
        loaderAnswer = false;
        update();
      }
    } on HttpExeption catch (e) {
      Get.snackbar(e.message, "حاول مره اخري !",
          borderRadius: 0,
          showProgressIndicator: false,
          duration: const Duration(seconds: 4));
    } catch (error) {
      loaderAnswer = false;
      update();
      print("multipleAnswer error == ${error}");
      throw (error);
    }
  }

  Future<void> textAnswer(
    int qId,
  ) async {
    try {
      lastId = qId;
      loaderAnswer = true;
      update();
      Dio.Response response = await dio().post(
        'questions/answer',
        data: Dio.FormData.fromMap({
                    'user_id': user?.user?.id,

          'que_id': qId,
          'text': txtAnswerController.text,
        }),
      );
      if (response.statusCode != 200) {
        loaderAnswer = false;
        update();
        throw HttpExeption(
            response.data['errors'] == "server error" ? "حاول مره اخري" : "");
      }
      if (response.statusCode == 200) {
        changeIndexnN();
        onTapP();
        loaderAnswer = false;
        update();
      }
    } on HttpExeption catch (e) {
      Get.snackbar(e.message, "حاول مره اخري !",
          borderRadius: 0,
          showProgressIndicator: false,
          duration: const Duration(seconds: 4));
    } catch (error) {
      loaderAnswer = false;
      update();
      print("textAnswer error == ${error}");
      throw (error);
    }
  }
}
