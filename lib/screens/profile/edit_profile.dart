import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:hakathon_elancer/utils/colors.dart';
// import 'package:hakathon_elancer/widgets/custom_button.dart';
// import 'package:hakathon_elancer/widgets/custom_text_feild.dart';

import '../../value/colors.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text_filed.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  late TextEditingController _nameTextController;
  late TextEditingController _skillTextController;
  late TextEditingController _facebookTextController;
  late TextEditingController _mostaqlTextController;
  late TextEditingController _linkedInTextController;
  late TextEditingController _twitterTextController;
  late TextEditingController _upworkTextController;
  late TextEditingController _kamsatTextController;
  late TextEditingController _freelanceTextController;

  bool _obscure = true;

  @override
  void initState() {
    super.initState();
    _nameTextController = TextEditingController();
    _skillTextController = TextEditingController();
    _facebookTextController = TextEditingController();
    _mostaqlTextController = TextEditingController();
    _linkedInTextController = TextEditingController();
    _twitterTextController = TextEditingController();
    _upworkTextController = TextEditingController();
    _kamsatTextController = TextEditingController();
    _freelanceTextController = TextEditingController();
  }

  @override
  void dispose() {
    _nameTextController.dispose();
    _skillTextController.dispose();
    _facebookTextController.dispose();
    _mostaqlTextController.dispose();
    _linkedInTextController.dispose();
    _twitterTextController.dispose();
    _upworkTextController.dispose();
    _kamsatTextController.dispose();
    _freelanceTextController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('تعديل الملف الشخصي',
            style: GoogleFonts.cairo(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black)),
        centerTitle: true,
        leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 9),
                child: Text('الاسم كاملا',
                    style: GoogleFonts.cairo(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black)),
              ),
              AppTextFiledHint(
                hintText: 'الاسم',
                textInputType: TextInputType.emailAddress,
                controller: _nameTextController,
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(bottom: 9),
                child: Text('المهارة',
                    style: GoogleFonts.cairo(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black)),
              ),
              AppTextFiledHint(
                hintText: 'المهارة',
                textInputType: TextInputType.emailAddress,
                controller: _skillTextController,
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(bottom: 9),
                child: Text('رابط فيسبوك',
                    style: GoogleFonts.cairo(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black)),
              ),
              AppTextFiledHint(
                hintText: 'اضف رابط فيسبوك',
                obscureText: _obscure,
                textInputType: TextInputType.text,
                controller: _facebookTextController,
                suffix: Icons.visibility
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(bottom: 9),
                child: Text('رابط لنكدان',
                    style: GoogleFonts.cairo(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black)),
              ),
              AppTextFiledHint(
                hintText: 'اضف رابط لنكدان',
                textInputType: TextInputType.emailAddress,
                controller: _linkedInTextController,
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(bottom: 9),
                child: Text('رابط تويتر',
                    style: GoogleFonts.cairo(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black)),
              ),
              AppTextFiledHint(
                hintText: 'اضف رابط تويتر',
                textInputType: TextInputType.emailAddress,
                controller: _twitterTextController,
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(bottom: 9),
                child: Text('رابط ابورك',
                    style: GoogleFonts.cairo(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black)),
              ),
              AppTextFiledHint(
                hintText: 'اضف رابط ابورك',
                textInputType: TextInputType.emailAddress,
                controller: _upworkTextController,
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(bottom: 9),
                child: Text('رابط مستقل',
                    style: GoogleFonts.cairo(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black)),
              ),
              AppTextFiledHint(
                hintText: 'اضف رابط مستقل',
                textInputType: TextInputType.emailAddress,
                controller: _mostaqlTextController,
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(bottom: 9),
                child: Text('رابط خمسات',
                    style: GoogleFonts.cairo(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black)),
              ),
              AppTextFiledHint(
                hintText: 'اضف رابط خمسات',
                textInputType: TextInputType.emailAddress,
                controller: _kamsatTextController,
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(bottom: 9),
                child: Text('رابط فريلانس',
                    style: GoogleFonts.cairo(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black)),
              ),
              AppTextFiledHint(
                hintText: 'اضف رابط فريلانس',
                textInputType: TextInputType.emailAddress,
                controller: _freelanceTextController,
              ),
              const SizedBox(height: 20),
              CustomButton(onPress: () {}, text: 'حفظ', color: AppColors.appColor)
            ],
          ),
        ),
      ),
    );
  }
}
