import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../value/colors.dart';
import '../../widgets/custom_text_filed.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final Uri _linedInUrl =
      Uri.parse('https://www.linkedin.com/in/nour-eihab-jaber-892675236/');
  final Uri _facebookUrl =
      Uri.parse('https://www.facebook.com/profile.php?id=100076749091728');
  final Uri _upworkUrl =
      Uri.parse('https://www.upwork.com/freelancers/~01ee0d5a16bf5a1890');
  final Uri _emailUrl =
      Uri.parse('https://mail.google.com/mail/u/0/#inbox?compose=new');
  List<Map<String, dynamic>> freelancerProfile = [
    {
      'name': 'صهيب بهاء الجزار',
      'image_url':
          'https://avatars.hsoubcdn.com/6c565e9e188f04fb0beb37ca8bd94f11?s=256',
      'job_name': 'مبرمج تطبيقات هواتف',
      'location': 'Gaza',
    },
  ];
  List<Map<String, dynamic>> freelancerProjects = [
    {
      'project_name': 'تطبيق WINLANCE',
      'image_url':
          'https://mostaql.hsoubcdn.com/uploads/thumbnails/1252035/635f9a9d3548a/WINLANCE-Cover.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F5F5),
      appBar: AppBar(
        title: Text(
          'الملف الشخصي',
          style: GoogleFonts.poppins(),
        ),
        backgroundColor: Colors.white,
      ),
      body: ListView(
        physics: const ScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 20.r, vertical: 12.r),
        children: [
          Align(
            alignment: AlignmentDirectional.topCenter,
            child: CachedNetworkImage(
              height: 120.h,
              width: 120.w,
              imageUrl:
                  'https://avatars.hsoubcdn.com/6c565e9e188f04fb0beb37ca8bd94f11?s=256',
              imageBuilder: (context, imageProvider) => Container(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(60.r),
                  image: DecorationImage(
                      image: imageProvider, fit: BoxFit.cover, scale: 10),
                ),
              ),
              placeholder: (context, url) => Center(
                child: SizedBox(
                  height: 40.h,
                  width: 40.w,
                  child: const CircularProgressIndicator(
                    strokeWidth: 2,
                  ),
                ),
              ),
              errorWidget: (context, url, error) => Icon(
                Icons.error,
                size: 30.r,
                color: Colors.red.shade800,
              ),
            ),
          ),
          Column(
            children: [
              SizedBox(
                height: 6.h,
              ),
              Text(
                freelancerProfile[0]['name'],
                style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 20.sp,
                    height: 0.h),
              ),
              Text(
                freelancerProfile[0]['job_name'],
                style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 16.sp,
                    height: 0.h),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/edit_profile_screen');
                },
                style: ElevatedButton.styleFrom(
                  primary: AppColors.appColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  minimumSize: Size(141.w, 40.h),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.edit_outlined,
                      size: 16.sp,
                      color: Colors.white70,
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Text(
                      'عدّل ملفك الشخصي',
                      style: GoogleFonts.poppins(
                          fontSize: 16.sp, color: Colors.white70),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 8.h,
              ),
              Row(
                children: [
                  const Spacer(),
                  IconButton(
                    onPressed: () {
                      _launchLinedInUrl();
                    },
                    icon: Image.asset(
                      'images/icon_1.png',
                      height: 16.h,
                      width: 16.w,
                    ),
                  ),
                  SizedBox(width: 5.w),
                  IconButton(
                    onPressed: () {
                      _launchFacebookUrl();
                    },
                    icon: Image.asset(
                      'images/icon_2.png',
                      height: 16.h,
                      width: 16.w,
                    ),
                  ),
                  // SizedBox(width: 2.w),

                  // SizedBox(width: 2.w),
                  IconButton(
                    onPressed: () {
                      _launchUpworkUrl();
                    },
                    icon: Image.asset(
                      'images/icon_4.png',
                      height: 16.h,
                      width: 16.w,
                    ),
                  ),
                  // SizedBox(width: 2.w),

                  const Spacer(),
                ],
              ),
              SizedBox(
                height: 24.h,
              ),
              Row(
                children: [
                  Text(
                    'أعمالي',
                    style: GoogleFonts.poppins(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                  ),
                  const Spacer(),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 7,
                    mainAxisSpacing: 7,
                    mainAxisExtent: 163.h),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: freelancerProjects.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: EdgeInsets.zero,
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CachedNetworkImage(
                          height: 128.h,
                          width: 180.w,
                          imageUrl: freelancerProjects[index]['image_url'],
                          imageBuilder: (context, imageProvider) => Container(
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),
                              image: DecorationImage(
                                  image: imageProvider,
                                  fit: BoxFit.cover,
                                  scale: 10),
                            ),
                          ),
                          placeholder: (context, url) => Center(
                            child: SizedBox(
                              height: 40.h,
                              width: 40.w,
                              child: const CircularProgressIndicator(
                                strokeWidth: 2,
                              ),
                            ),
                          ),
                          errorWidget: (context, url, error) => Icon(
                            Icons.error,
                            size: 30.r,
                            color: Colors.red.shade800,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.only(start: 8.w),
                          child: Text(
                            freelancerProjects[index]['project_name'],
                            style: GoogleFonts.poppins(),
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
              SizedBox(
                height: 3.h,
              )
            ],
          ),
        ],
      ),
      bottomNavigationBar: Card(
        elevation: 0,
        margin: EdgeInsets.zero,
        color: const Color(0xffF5F5F5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.only(top: 10.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: AppColors.greenRadioActiveColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      minimumSize: Size(161.w, 48.h),
                    ),
                    onPressed: () {
                      _launchFacebookUrl();
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.phone_outlined,
                          size: 16.sp,
                          color: Colors.white70,
                        ),
                        SizedBox(
                          width: 12.w,
                        ),
                        Text(
                          'تواصل مع المستقل',
                          style: GoogleFonts.poppins(
                              fontSize: 16.sp, color: Colors.white70),
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: AppColors.appColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      minimumSize: Size(161.w, 48.h),
                    ),
                    onPressed: () {
                      _launchEmailUrl();
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.email_outlined,
                          size: 16.sp,
                          color: Colors.white70,
                        ),
                        SizedBox(
                          width: 12.w,
                        ),
                        Text(
                          'أرسل إيميل',
                          style: GoogleFonts.poppins(
                              fontSize: 16.sp, color: Colors.white70),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.only(bottom: 10.h, top: 5.h),
              child: FloatingActionButton(
                onPressed: () {
                  showAlertDialogAddProject();
                },
                backgroundColor: AppColors.appColor,
                child: Icon(
                  Icons.add,
                  size: 60.r,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _launchLinedInUrl() async {
    if (!await launchUrl(_linedInUrl)) {
      throw 'Could not launch $_linedInUrl';
    }
  }

  Future<void> _launchFacebookUrl() async {
    if (!await launchUrl(_facebookUrl)) {
      throw 'Could not launch $_facebookUrl';
    }
  }

  Future<void> _launchUpworkUrl() async {
    if (!await launchUrl(_upworkUrl)) {
      throw 'Could not launch $_upworkUrl';
    }
  }

  Future<void> _launchEmailUrl() async {
    if (!await launchUrl(_emailUrl)) {
      throw 'Could not launch $_emailUrl';
    }
  }

  void showAlertDialogAddProject() {
    showDialog(
        context: context,
        builder: (_) {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
            return AlertDialog(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r)),
              title: Center(
                child: Text(
                  'إضافة مشروع',
                  style: GoogleFonts.poppins(fontSize: 18.sp),
                ),
              ),
              content: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50.r),
                ),
                height: 745.h,
                width: 343.w,
                child: ListView(
                  children: [
                    Text(
                      'اسم المشروع',
                      style: GoogleFonts.poppins(
                        fontSize: 16.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    const AppTextFiledHint(
                      hintText: 'أدخل اسم المشروع',
                      textInputType: TextInputType.text,
                    ),
                    Text(
                      'تفاصيل المشروع',
                      style: GoogleFonts.poppins(
                        fontSize: 16.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    const AppTextFiledHint(
                      hintText: 'التفاصيل',
                      textInputType: TextInputType.multiline,
                      maxLength: 4,
                      height: 120,
                    ),
                    Text(
                      'رابط المشروع',
                      style: GoogleFonts.poppins(
                        fontSize: 16.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    const AppTextFiledHint(
                      hintText: 'أدخل رابط الكورس',
                      textInputType: TextInputType.text,
                    ),
                    Text(
                      'صورة تعريفية للمشروع',
                      style: GoogleFonts.poppins(
                        fontSize: 16.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    const AppTextFiledHint(
                      hintText: '',
                      textInputType: TextInputType.text,
                      suffix: Icons.file_upload_outlined,
                    ),
                  ],
                ),
              ),
              actions: [
                SizedBox(
                  height: 48.h,
                  width: 322.w,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      primary: AppColors.appColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.r),
                        ),
                      ),
                    ),
                    child: Text(
                      'حفظ',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.sp,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
              ],
            );
          });
        });
  }
}
