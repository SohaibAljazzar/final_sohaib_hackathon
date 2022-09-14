import 'package:final_sohaib_hackathon/prefs/shared_pref_controller.dart';
import 'package:final_sohaib_hackathon/screens/app/admin/ads_detiles_admin.dart';
import 'package:final_sohaib_hackathon/screens/app/admin/courese_detiles_admin.dart';
import 'package:final_sohaib_hackathon/screens/app/admin/course_details.dart';
import 'package:final_sohaib_hackathon/screens/app/ads_detiles.dart';
import 'package:final_sohaib_hackathon/screens/app/home_screen.dart';
import 'package:final_sohaib_hackathon/screens/app/profile_screen.dart';
import 'package:final_sohaib_hackathon/screens/auth/login_screen.dart';
import 'package:final_sohaib_hackathon/screens/auth/register_screen.dart';
import 'package:final_sohaib_hackathon/screens/onboarding/onboarding_screen.dart';
import 'package:final_sohaib_hackathon/screens/profile/edit_profile.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'firebase_options.dart';
import 'screens/core/launch_screen.dart';

// import 'screens/core/launch_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefController().initPreferences();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            scaffoldBackgroundColor: Colors.white,
            appBarTheme: AppBarTheme(
              centerTitle: true,
              elevation: 0,
              backgroundColor: Colors.white,
              iconTheme: const IconThemeData(color: Colors.black),
              titleTextStyle: GoogleFonts.cairo(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          initialRoute: '/launch_screen',
          routes: {
            '/launch_screen': (context) => const LaunchScreen(),
            '/on_boarding_screen': (context) => const OnBoardingScreen(),
            '/profile_screen': (context) => const ProfileScreen(),
            '/login_screen': (context) => const LoginScreen(),
            '/register_screen': (context) => const RegisterScreen(),
            '/home_screen': (context) => const HomeScreen(),
            '/ads_details': (context) => AdsDetiles(),
            '/ads_details_admin': (context) => const AdsDetilesAdmin(),
            '/course_details_admin': (context) => const CoureseDetilesAdmin(),
            '/course_details': (context) => CourseDetails(),
            '/edit_profile_screen': (context) => const EditProfileScreen(),
          },
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('ar'),
            Locale('en'),
          ],
          locale: const Locale('ar'),
        );
      },
    );
  }
}
