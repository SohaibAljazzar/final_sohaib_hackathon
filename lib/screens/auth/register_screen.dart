import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:final_sohaib_hackathon/models/fb_response.dart';
import 'package:final_sohaib_hackathon/models/skill.dart';
import 'package:final_sohaib_hackathon/prefs/shared_pref_controller.dart';
import 'package:final_sohaib_hackathon/utils/context_extenssion.dart';
import 'package:final_sohaib_hackathon/widgets/custom_button.dart';
import 'package:final_sohaib_hackathon/widgets/custom_text_filed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:future_progress_dialog/future_progress_dialog.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import '../../firebase/fb_auth_controller.dart';
import '../../value/colors.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late TextEditingController _nameTextController;
  late TextEditingController _emailTextController;
  late TextEditingController _passwordTextController;
  final bool _obscure = true;
  int? _selectedSkillId;
  XFile? pickedImage;
  XFile? pickedImage2;
  bool isImageEdit = false;
  IconData iconEditImage = Icons.camera_alt_outlined;
  ImagePicker imagePicker = ImagePicker();
  String selectedImage = '';

  late ImagePicker _imagePicker;
  XFile? _pickedImage;

  final List<Skill> _skills = <Skill>[
    const Skill(id: 1, title: 'مصمم جرافيك'),
    const Skill(id: 2, title: 'مبرمج ويب'),
    const Skill(id: 3, title: 'مبرمج موبايل'),
    const Skill(id: 4, title: 'مصمم UX/UI'),
  ];

  @override
  void initState() {
    super.initState();
    _nameTextController = TextEditingController();
    _emailTextController = TextEditingController();
    _passwordTextController = TextEditingController();
    _imagePicker = ImagePicker();
  }

  @override
  void dispose() {
    _nameTextController.dispose();
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
        title: Text('انشاء حساب',
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
              const SizedBox(
                height: 10,
              ),
              Center(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        offset: const Offset(0, 0),
                        color: Colors.white.withOpacity(0.16),
                        blurRadius: 6,
                      ),
                    ],
                  ),
                  child: Stack(
                    alignment: AlignmentDirectional.bottomEnd,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(80),
                          border: Border.all(width: 8, color: Colors.white),
                        ),
                        child: Container(
                          clipBehavior: Clip.antiAlias,
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: AppColors.appColor),
                          child: SharedPrefController()
                                  .getDataByKey(key: 'image')
                                  .isNotEmpty
                              ? pickedImage2 != null
                                  ? Image.file(
                                      File(pickedImage2!.path),
                                      fit: BoxFit.cover,
                                    )
                                  : CachedNetworkImage(
                                      imageUrl: SharedPrefController()
                                          .getDataByKey(key: 'image'),
                                      height: 60.h,
                                      width: 60.w,
                                      imageBuilder: (context, imageProvider) =>
                                          Container(
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: imageProvider,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      placeholder: (context, url) =>
                                          FutureProgressDialog(uploadImage(),
                                              message: const Text(
                                                  'Uploading image...')),
                                      errorWidget: (context, url, error) =>
                                          const Icon(Icons.error),
                                    )
                              : pickedImage2 != null
                                  ? Image.file(
                                      File(pickedImage2!.path),
                                      fit: BoxFit.cover,
                                    )
                                  : const Icon(
                                      Icons.add_photo_alternate_outlined,
                                      color: Colors.white,
                                      size: 50,
                                    ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.only(
                            bottom: 12.h, end: 5.r, top: 0.h, start: 0.r),
                        child: CircleAvatar(
                          backgroundColor: AppColors.appColor,
                          radius: 13,
                          child: IconButton(
                            padding: EdgeInsetsDirectional.zero,
                            onPressed: () {
                              isImageEdit = !isImageEdit;
                              if (isImageEdit == true) {
                                pickImage();
                                setState(() {
                                  pickImage();
                                  iconEditImage = Icons.check_outlined;
                                  // print('go to check');
                                });
                              }
                              if (isImageEdit == false) {
                                setState(() {
                                  // print('back to edit');
                                  iconEditImage = Icons.camera_alt_outlined;

                                  ///method update image
                                  updateImage(image: selectedImage);
                                  SharedPrefController().setDataByKey(
                                      key: 'image', value: selectedImage);
                                });
                              }
                            },
                            icon: Icon(
                              iconEditImage,
                              color: Colors.white,
                              size: 18,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
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
                child: Text('البريد الالكتروني',
                    style: GoogleFonts.cairo(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black)),
              ),
              AppTextFiledHint(
                hintText: 'البريد الالكتروني',
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
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(bottom: 9),
                child: Text('رقم الجوال',
                    style: GoogleFonts.cairo(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black)),
              ),
              AppTextFiledHint(
                hintText: 'رقم الجوال',
                textInputType: TextInputType.emailAddress,
                controller: _emailTextController,
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(bottom: 9),
                child: Text('الجنس',
                    style: GoogleFonts.cairo(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black)),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: const Color(0xFFDFDEDE))),
                child: DropdownButton<int>(
                  isExpanded: true,
                  hint: Text('الجنس',
                      style: GoogleFonts.cairo(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xFFCCCCCC))),
                  style: GoogleFonts.montserrat(
                    color: Colors.black,
                  ),
                  onChanged: (int? value) {
                    setState(() => _selectedSkillId = value);
                  },
                  borderRadius: BorderRadius.circular(10),
                  onTap: () {},
                  icon: const Icon(Icons.keyboard_arrow_down_sharp),
                  itemHeight: 48,
                  value: _selectedSkillId,
                  underline:
                      const Divider(color: Colors.transparent, height: 0),
                  items: _skills.map(
                    (skill) {
                      return DropdownMenuItem<int>(
                        value: skill.id,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(skill.title),
                            // Divider(
                            //   thickness: 0.8,
                            //   color: Colors.grey.shade400,
                            // )
                          ],
                        ),
                      );
                    },
                  ).toList(),
                ),
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
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: const Color(0xFFDFDEDE))),
                child: DropdownButton<int>(
                  isExpanded: true,
                  hint: Text('اختر مهارة',
                      style: GoogleFonts.cairo(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xFFCCCCCC))),
                  style: GoogleFonts.montserrat(
                    color: Colors.black,
                  ),
                  onChanged: (int? value) {
                    setState(() => _selectedSkillId = value);
                  },
                  borderRadius: BorderRadius.circular(10),
                  onTap: () {},
                  icon: const Icon(Icons.keyboard_arrow_down_sharp),
                  itemHeight: 48,
                  value: _selectedSkillId,
                  underline:
                      const Divider(color: Colors.transparent, height: 0),
                  items: _skills.map(
                    (skill) {
                      return DropdownMenuItem<int>(
                        value: skill.id,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(skill.title),
                            // Divider(
                            //   thickness: 0.8,
                            //   color: Colors.grey.shade400,
                            // )
                          ],
                        ),
                      );
                    },
                  ).toList(),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(bottom: 9),
                child: Text('مستوى الخبرة',
                    style: GoogleFonts.cairo(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black)),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: const Color(0xFFDFDEDE))),
                child: DropdownButton<int>(
                  isExpanded: true,
                  hint: Text('مستوى الخبرة',
                      style: GoogleFonts.cairo(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xFFCCCCCC))),
                  style: GoogleFonts.montserrat(
                    color: Colors.black,
                  ),
                  onChanged: (int? value) {
                    setState(() => _selectedSkillId = value);
                  },
                  borderRadius: BorderRadius.circular(10),
                  onTap: () {},
                  icon: const Icon(Icons.keyboard_arrow_down_sharp),
                  itemHeight: 48,
                  value: _selectedSkillId,
                  underline:
                      const Divider(color: Colors.transparent, height: 0),
                  items: _skills.map(
                    (skill) {
                      return DropdownMenuItem<int>(
                        value: skill.id,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(skill.title),
                            // Divider(
                            //   thickness: 0.8,
                            //   color: Colors.grey.shade400,
                            // )
                          ],
                        ),
                      );
                    },
                  ).toList(),
                ),
              ),
              const SizedBox(height: 20),
              CustomButton(
                  onPress: () async => await _performRegister(),
                  text: 'انشاء حساب',
                  color: AppColors.appColor)
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _performRegister() async {
    if (_checkData()) {
      await _register();
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

  Future<void> _register() async {
    FbResponse fbResponse = await FbAuthController().createAccount(
      _emailTextController.text,
      _passwordTextController.text,
    );
    if (fbResponse.success) {
      Navigator.pop(context);
    }
    context.showSnackBar(
        message: fbResponse.message, error: !fbResponse.success);
  }

  Future<void> pickImage() async {
    pickedImage = await imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      showDialog(
        context: context,
        builder: (context) => FutureProgressDialog(uploadImage(),
            message: const Text('Uploading image...')),
      );
      setState(() {
        pickedImage2 = pickedImage;
      });
    }
  }

  Future<void> uploadImage() async {
    // selectedImage = await FirebaseStorageController()
    //     .uploadImagee(File(pickedImage!.path), 'profile');
  }

  Future<void> updateImage({required String image}) async {
    // await FirebaseFirestoreController()
    //     .update(key: 'imageUrl', value: image, context: context);
    // await FbFireStoreController().updateAdminImage(path: widget.admin.path, image: selectedImage);
  }
}
