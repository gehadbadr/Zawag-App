import 'dart:convert';

import 'package:effa/models/user/user_data.dart';
import 'package:effa/ui/screens/auth/login.dart';
import 'package:effa/ui/screens/dashboard/male_dashboard.dart';
import 'package:effa/ui/screens/detailed%20_personal_data/detaild_data.dart';
import 'package:effa/ui/screens/main_data/main_data.dart';
import 'package:effa/ui/screens/terms/trems.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:effa/helper/dio_helper.dart';
import 'package:dio/dio.dart'as Dio;
class TransitionController extends GetxController{
  @override
  void onInit() {
    trans();
    // TODO: implement onInit
    super.onInit();
  }
  UserInfooo? user;
  Widget? page;
  UserState? userState;
  void trans()async{
    await fetchUserData();
    if(user?.user?.id == null){
      page = LoginPage();
      update();
    }else{
      if(userState?.state == 1){
        page = Terms();
        update();
      }else if(userState?.state == 2){
        page =  MainData();
        update();
      }else if(userState?.state == 3){
        page = DetailedInfo();
        update();
      }else if(userState?.state == 4){
        page = DashBoardMale();
        update();
      }
    }
  }
  Future <void> fetchUserData() async {
    try {
      final Dio.Response response = await dio().get(
        'myData',
      );
      final Dio.Response response2 = await dio().get(
        'stats',
      );
      if(response.statusCode == 200){
        user = UserInfooo.fromJson(response.data);
      }
      if(response2.statusCode == 200){
        userState = UserState.fromJson(response.data);
      }
    } catch (err) {

      // ignore: unnecessary_brace_in_string_interps
    }
  }
}
UserState welcomeFromJson(String str) => UserState.fromJson(json.decode(str));

String welcomeToJson(UserState data) => json.encode(data.toJson());
class UserState {
  UserState({
    required this.state,
  });
  late final int state;

  UserState.fromJson(Map<String, dynamic> json){
    state = json['state'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['state'] = state;
    return _data;
  }
}