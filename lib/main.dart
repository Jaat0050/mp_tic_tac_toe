import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mp_tic_tak_toe/app/resources/provider/room_data_provider.dart';
import 'package:mp_tic_tak_toe/app/screens/create_room.dart';
import 'package:mp_tic_tak_toe/app/screens/game_screen.dart';
import 'package:mp_tic_tak_toe/app/screens/join_room.dart';
import 'package:mp_tic_tak_toe/app/screens/main_menu.dart';
import 'package:mp_tic_tak_toe/app/utils/constants.dart';
import 'package:provider/provider.dart';

void main()async {
    try {
      await _initializePrefs();
    } catch (e) {
    if (kDebugMode) {
      print(e.toString());
    }
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
    statusBarIconBrightness: Brightness.dark,
  ));
  // await SharedPreferencesHelper.init();

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
        return ChangeNotifierProvider(
          create: (context) => RoomDataProvider(),
          child: MaterialApp(
            title: 'Multiplayer TTT',
            debugShowCheckedModeBanner: false,
            theme: ThemeData.dark()
                .copyWith(scaffoldBackgroundColor: MyColors.bgColor),
            routes: {
              MainMenuScreen.routeName: (context) => const MainMenuScreen(),
              JoinRoomScreen.routeName: (context) => const JoinRoomScreen(),
              CreateRoomScreen.routeName: (context) => const CreateRoomScreen(),
              GameScreen.routeName: (context) => const GameScreen(),
            },
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
                child: const MainMenuScreen(),
              ),
            ),
          ),
        );
      },
    );
  }
}

