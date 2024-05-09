// ignore_for_file: library_prefixes

import 'package:country_picker/country_picker.dart';
import 'package:dio/dio.dart' as Dio;
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';

import 'package:effa/controllers/transition.dart';
import 'package:effa/firebase_options.dart';
import 'package:effa/helper/app_colors.dart';
import 'package:effa/helper/dio_helper.dart';
import 'package:effa/models/user/user_data.dart';
import 'package:effa/ui/screens/auth/login.dart';
import 'package:effa/ui/screens/dashboard/male_dashboard.dart';
import 'package:effa/ui/screens/detailed%20_personal_data/detaild_data.dart';
import 'package:effa/ui/screens/main_data/main_data.dart';
import 'package:effa/ui/screens/terms/trems.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await ScreenUtil.ensureScreenSize();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    // Status bar color
    statusBarColor: Colors.white,
    // Status bar brightness (optional)
    statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
    statusBarBrightness: Brightness.light, // For iOS (dark icons)
  ));
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  UserInfooo? user;
  Widget? page;
  UserState? userState;
  void trans() async {
    await fetchUserData();

    if (user?.user?.id == null) {
      setState(() {
        page = LoginPage();
        // page = DetailedInfo(
        //   showEdit: false,
        // );

        //  page = CustomRegisterView();
        // page = ExhaustedAttemps(onPressed: (){},mainBalance: "150",showCost: "100",);
      });
      FlutterNativeSplash.remove();
    } else {
      if (userState?.state == 1) {
        setState(() {
          page = Terms();
        });
        FlutterNativeSplash.remove();
        } else if (userState?.state == 2) {
          setState(() {
            page = MainData();
          });
          FlutterNativeSplash.remove();
        } else if (userState?.state == 3) {
  //    } else if (userState?.state == 2) {
        setState(() {
          page = DetailedInfo(
            showEdit: false,
          );
        });
        FlutterNativeSplash.remove();
      } else if (userState?.state == 4) {
        setState(() {
          page = DashBoardMale();
        });
        FlutterNativeSplash.remove();
      }
    }
  }

  Future<void> fetchUserData() async {
    print("dsfdssdg");
    try {
      final Dio.Response response = await dio().get(
        'myData',
      );
      final Dio.Response response2 = await dio().get(
        'stats',
      );
      if (response.statusCode == 200 && response2.statusCode == 200) {
        user = UserInfooo.fromJson(response.data);
        userState = UserState.fromJson(response2.data);
      }
      print(user?.user?.id);
      print(userState?.state);
      print("dsfdshhhhhhhhhhhhsdg");
    } catch (err) {
      if (user?.user?.id == null) {
        setState(() {
          page = DetailedInfo(
            showEdit: false,
          );

          //    page = LoginPage();
        });
        FlutterNativeSplash.remove();
      }
      //rethrow;
      // ignore: unnecessary_brace_in_string_interps
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      // minimum: EdgeInsets.only(top: 60),
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: ((context, child) => Directionality(
              textDirection: TextDirection.rtl,
              child: GetMaterialApp(
                  title: 'عفه',
                  supportedLocales: const [
                    Locale('ar'),
                  ],
                  locale: const Locale('ar'),
                  localizationsDelegates: const [
                    CountryLocalizations.delegate,
                    GlobalMaterialLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                  ],
                  textDirection: TextDirection.ltr,
                  theme: ThemeData(
                    primaryColor: basicPink,
                    checkboxTheme:
                        CheckboxThemeData(side: BorderSide(color: basicPink)),
                    primarySwatch: MaterialColor(
                      Colors.black.value,
                      const <int, Color>{
                        50: Colors.pinkAccent,
                        100: Colors.pinkAccent,
                        200: Colors.pinkAccent,
                        300: Colors.pinkAccent,
                        400: Colors.pinkAccent,
                        500: Colors.pinkAccent,
                        600: Colors.pinkAccent,
                        700: Colors.pinkAccent,
                        800: Colors.pinkAccent,
                        900: Colors.pinkAccent,
                      },
                    ),
                  ),
                  debugShowCheckedModeBanner: false,
                  onInit: () {
                    trans();
                  },
                  home:
                      // DashBoardMale()
                      page ??
                          const Scaffold(
                            body: Center(
                              child: CircularProgressIndicator(
                                color: basicPink,
                              ),
                            ),
                          )),
            )),
      ),
    );
  }
}


//WGDAuW9LF8Ubsmi9yh26mndA43r1