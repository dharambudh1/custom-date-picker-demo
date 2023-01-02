import "package:custom_date_picker_demo/screens/home_screen.dart";
import "package:custom_date_picker_demo/utils/shared_pref_manager.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";

/*
Doctor summary (to see all details, run flutter doctor -v):
[✓] Flutter (Channel stable, 3.3.8, on macOS 13.1 22C65 darwin-arm (Rosetta),
    locale en-IN)
[✓] Android toolchain - develop for Android devices (Android SDK version 33.0.1)
[✓] Xcode - develop for iOS and macOS (Xcode 14.1)
[✓] Chrome - develop for the web
[✓] Android Studio (version 2021.3)
[✓] Connected device (3 available)
[✓] HTTP Host Availability
*/

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefManager().initSharedPreferences();
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      enableLog: false,
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
