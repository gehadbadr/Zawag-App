import 'package:effa/firebase_options.dart';
import 'package:effa/helper/app_colors.dart';
import 'package:effa/ui/screens/detailed%20_personal_data/detaild_data.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: ((context,child)=> Directionality(
          textDirection: TextDirection.rtl,
          child: SafeArea(
            child: GetMaterialApp(
              title: 'عفه',
              theme: ThemeData(
                primaryColor: basicPink,
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
              home: const DetailedInfo(),
            ),
          ),)),
    );
  }
}


//WGDAuW9LF8Ubsmi9yh26mndA43r1