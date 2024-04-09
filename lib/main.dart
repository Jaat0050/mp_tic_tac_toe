import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mp_tic_tak_toe/constants.dart';
import 'package:mp_tic_tak_toe/home_page.dart';
import 'package:mp_tic_tak_toe/sharedpref_helper.dart';

void main()async {
    try {
      await _initializePrefs();
    } catch (e) {
      print(e.toString());
    }
  runApp(const MyApp());
}


Future<void> _initializePrefs() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: MyColors.blue,
    statusBarIconBrightness: Brightness.light,
  ));
  await SharedPreferencesHelper.init();

  // isFirstTime = SharedPreferencesHelper.getisFirstTime();
  // isLoggedIn = SharedPreferencesHelper.getIsLoggedIn();


}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      useInheritedMediaQuery: true,
      designSize: Size(MediaQuery.of(context).size.width,
          MediaQuery.of(context).size.height),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          title: 'Multiplayer TTT',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
            useMaterial3: false,
          ),
          home: Scaffold(
            body: DoubleBackToCloseApp(
              snackBar: SnackBar(
                backgroundColor: const Color(0xffF3F5F7),
                shape: ShapeBorder.lerp(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(2.0),
                  ),
                  const StadiumBorder(),
                  0.2,
                )!,
                width: 200,
                behavior: SnackBarBehavior.floating,
                content: Text(
                  'Double tap to exit app',
                  style: TextStyle(
                    color: MyColors.blue,
                  ),
                  textAlign: TextAlign.center,
                ),
                duration: const Duration(seconds: 1),
              ),
              child: MyHomePage(title: 'Hy'),
            ),
          ),
        );
      },
    );
  }
}

