import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:music_shuffle/config/constants.dart';
import 'package:music_shuffle/config/navigator_key.dart';
import 'package:music_shuffle/controllers/home_controller.dart';
import 'package:music_shuffle/controllers/onboarding_controller.dart';
import 'package:music_shuffle/controllers/spotify_controller.dart';
import 'package:music_shuffle/controllers/youtube_controller.dart';
import 'package:music_shuffle/utils/local_storage.dart';
import 'package:music_shuffle/views/home/home_view.dart';
import 'package:music_shuffle/views/onboarding/onboarding_view.dart';

Future main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  // Load environment variables
  await dotenv.load(fileName: ".env");

  // Initialize storage
  await GetStorage.init();

  // Dependency injection
  Get.lazyPut(() => OnboardingController());
  Get.lazyPut(() => HomeController());
  Get.put(YoutubeController());
  Get.put(SpotifyController());

  // whenever your initialization is completed, remove the splash screen:
  FlutterNativeSplash.remove();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Archivo',
        scaffoldBackgroundColor: blackColor,
        splashFactory: NoSplash.splashFactory,
        splashColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            minimumSize: Size.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40),
            ),
          ),
        ),
      ),
      navigatorKey: NavigatorKey.navigatorKey,
      home: LocalStorage.getData(isOnboardingDone, KeyType.BOOL)
          ? const HomeView()
          : const OnboardingView(),
    );
  }
}
