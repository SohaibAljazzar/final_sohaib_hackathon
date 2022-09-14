import 'package:final_sohaib_hackathon/firebase/fb_auth_controller.dart';
import 'package:final_sohaib_hackathon/prefs/shared_pref_controller.dart';
import 'package:final_sohaib_hackathon/screens/app/home_screen.dart';
import 'package:final_sohaib_hackathon/screens/auth/login_screen.dart';
import 'package:final_sohaib_hackathon/screens/onboarding/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class LaunchScreen extends StatefulWidget {
  const LaunchScreen({Key? key}) : super(key: key);

  @override
  State<LaunchScreen> createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {
  String isFirst = SharedPrefController().getDataByKey(key: 'first');
  bool isLogin = FbAuthController().loggedIn;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Widget widgetRoute = isFirst == '1'
        ? isLogin
            ? const HomeScreen()
            : const LoginScreen()
        : const OnBoardingScreen();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => widgetRoute));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          'images/logo.png',
        ),
      ),
    );
  }
}
