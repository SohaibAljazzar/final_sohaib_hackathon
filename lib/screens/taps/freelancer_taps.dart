import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../value/colors.dart';

class FreelancerScreen extends StatelessWidget {
  List<Map<String, dynamic>> freelancerProfile = [
    {
      'name': 'صهيب الجزار',
      'image_url':
          'https://avatars.hsoubcdn.com/6c565e9e188f04fb0beb37ca8bd94f11?s=256',
      'job_name': 'مبرمج تطبيقات',
    },
    {
      'name': 'آيات أحمد أحمد',
      'image_url':
          'https://avatars.hsoubcdn.com/01bd512f8f3e59bc9d06c9e1149075ff?s=256',
      'job_name': 'متخصصة SEO',
    },
    {
      'name': 'أحمد العامودي',
      'image_url':
          'https://lh3.googleusercontent.com/a-/AFdZucrcqfMsvnvLJp5M5yvGL9vEzBMLFDkfHrVihxSPSQ=s64-c',
      'job_name': 'مسوق الكتروني',
    },
  ];

  FreelancerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
      child: ListView.builder(
          itemCount: freelancerProfile.length,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsetsDirectional.only(bottom: 12.h),
              height: 80.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: Row(
                    children: [
                      CachedNetworkImage(
                        height: 80.h,
                        width: 50.w,
                        imageUrl: freelancerProfile[index]['image_url'],
                        imageBuilder: (context, imageProvider) => Container(
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.r),
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
                      SizedBox(
                        width: 20.w,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 100.w,
                            child: Text(
                              freelancerProfile[index]['name'],
                              style: GoogleFonts.cairo(
                                  fontWeight: FontWeight.w500, fontSize: 16.sp),
                            ),
                          ),
                          SizedBox(
                            width: 100.w,
                            child: Text(
                              freelancerProfile[index]['job_name'],
                              style: GoogleFonts.cairo(
                                  fontWeight: FontWeight.w400, fontSize: 14.sp),
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/profile_screen');
                        },
                        style: ElevatedButton.styleFrom(
                            primary: AppColors.appColor),
                        child: Text(
                          'الصفحة الشخصية',
                          style: GoogleFonts.cairo(
                              fontWeight: FontWeight.w500, fontSize: 14.sp),
                        ),
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
