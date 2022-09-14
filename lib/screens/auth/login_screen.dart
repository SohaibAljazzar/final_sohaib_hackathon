import 'package:final_sohaib_hackathon/firebase/fb_auth_controller.dart';
import 'package:final_sohaib_hackathon/models/fb_response.dart';
import 'package:final_sohaib_hackathon/prefs/shared_pref_controller.dart';
import 'package:final_sohaib_hackathon/utils/context_extenssion.dart';
import 'package:final_sohaib_hackathon/widgets/custom_text_filed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svprogresshud/flutter_svprogresshud.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../value/colors.dart';
import '../../widgets/custom_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController _emailTextController;
  late TextEditingController _passwordTextController;
  final bool _obscure = true;
  late String _language;

  @override
  void initState() {
    super.initState();
    _language =
        SharedPrefController().getValueFor(PrefKeys.language.name) ?? 'en';
    _emailTextController = TextEditingController();
    _passwordTextController = TextEditingController();
  }

  @override
  void dispose() {
    _emailTextController.dispose();
    _passwordTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('تسجيل دخول',
            style: GoogleFonts.cairo(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: Image(
                  image: AssetImage('images/logo.png'),
                  height: 200,
                  width: 200,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 9),
                child: Text('البريد الالكتروني',
                    style: GoogleFonts.cairo(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black)),
              ),
              AppTextFiledHint(
                hintText: 'البريد',
                textInputType: TextInputType.emailAddress,
                controller: _emailTextController,
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(bottom: 9),
                child: Text('كلمة المرور',
                    style: GoogleFonts.cairo(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black)),
              ),
              AppTextFiledHint(
                  hintText: 'كلمة المرور',
                  obscureText: _obscure,
                  textInputType: TextInputType.text,
                  controller: _passwordTextController,
                  suffix: Icons.visibility),
              const SizedBox(height: 20),
              CustomButton(
                  onPress: () async => await _performLogin(),
                  text: 'تسجيل الدخول',
                  color: AppColors.appColor),
              // ElevatedButton(
              //   onPressed: () {},
              //   //  _performLogin(),
              //   style: ElevatedButton.styleFrom(
              //       minimumSize: const Size(double.infinity, 50),
              //       shape: RoundedRectangleBorder(
              //           borderRadius: BorderRadius.circular(5))),
              //   child: Text(
              //     'تسجيل الدخول',
              //     style: GoogleFonts.cairo(),
              //   ),
              // ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('ليس لديك حساب ؟',
                      style: GoogleFonts.cairo(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.black)),
                  TextButton(
                    onPressed: () =>
                        Navigator.pushNamed(context, '/register_screen'),
                    child: Text(
                      'أنشئ حساب',
                      style: GoogleFonts.cairo(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF0F62AC),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _performLogin() async {
    if (_checkData()) {
      SVProgressHUD.show();

      await _login();
    }
  }

  bool _checkData() {
    if (_emailTextController.text.isNotEmpty &&
        _passwordTextController.text.isNotEmpty) {
      return true;
    }
    context.showSnackBar(message: 'Enter required data!', error: true);
    return false;
  }

  Future<void> _login() async {
    //TODO: Call login api request
    FbResponse fbResponse = await FbAuthController()
        .signIn(_emailTextController.text, _passwordTextController.text)
        .catchError((onError) {
      SVProgressHUD.dismiss();
    });
    if (fbResponse.success) {
      SVProgressHUD.dismiss();

      Navigator.pushReplacementNamed(context, '/home_screen');
    }
    SVProgressHUD.dismiss();

    context.showSnackBar(
        message: fbResponse.message, error: !fbResponse.success);
  }
}
