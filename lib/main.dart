import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rare_task/utils/themes/color_schemes.g.dart';
import 'package:rare_task/utils/themes/palette.dart';
import 'package:rare_task/view/splash/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

// Ideal time to initialize
//   await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'rare task',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorSchemes.darkColorScheme,
        textTheme: TextThemes.darkTextTheme,
        primarySwatch: Palette.kBlue,
      ),
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Manrope-bold',
        scaffoldBackgroundColor: Color(0xFFF5F5F9),
        textTheme: TextThemes.lightTextTheme,
        colorScheme: ColorSchemes.lightColorScheme,
        primarySwatch: Palette.kBlue,
        iconTheme: IconThemes.lightIconTheme,
        appBarTheme: AppBarThemes.lightAppBarTheme,
        buttonTheme: ButtonThemes.lightButtonTheme,
      ),
      home: SplashScreen(),
    );
  }
}
