import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class CourseDetails extends StatelessWidget {
  final Uri _urlContentWriting =
      Uri.parse('https://www.youtube.com/watch?v=zs3PiS1t13g');
  List<Map<String, dynamic>> courseData = [
    {
      'publisher_name': 'Sohaib Aljazzar',
      'course_image_url':
          'https://ijnet.org/sites/default/files/styles/full_width_node/public/story/2020-11/thumbnail_job-1257202_1920.png?h=490c3481&itok=-J9smwFG',
      'title': 'كتابة المحتوى',
      'course_link': 'https://www.youtube.com/watch?v=zs3PiS1t13g',
      'description':
          'مجموعة من المحاضرات تشرح لك كيف تكتب ملفات تعريف للشركات ومقالات ومحتويات المواقع.',
    },
  ];

  CourseDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'تفاصيل الكورس',
          style: GoogleFonts.cairo(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              color: Colors.black),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 15.h),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black,
                    ),
                  ]),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CachedNetworkImage(
                    height: 220.h,
                    width: double.infinity,
                    imageUrl: courseData[0]['course_image_url'],
                    imageBuilder: (context, imageProvider) => Container(
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
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
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: Row(
                      children: [
                        Image.asset(
                          'images/prof.png',
                          height: 35.h,
                          width: 35.w,
                        ),
                        Text(
                          'نور إيهاب',
                          style: GoogleFonts.cairo(fontSize: 16.sp),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 12.w, vertical: 14.h),
                    child: Row(
                      children: [
                        Text(
                          courseData[0]['title'],
                          style: GoogleFonts.cairo(
                              fontSize: 18.sp, fontWeight: FontWeight.w700),
                        ),
                        const Spacer(),
                        const Text('30h')
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                    child: Text(
                      courseData[0]['description'],
                      style: GoogleFonts.cairo(
                          fontSize: 16.sp, fontWeight: FontWeight.w400),
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.w),
                      child: Row(
                        children: [
                          Icon(
                            Icons.link,
                            color: Colors.blue,
                            size: 22.sp,
                          ),
                          TextButton(
                            onPressed: () {
                              _launchUrlContentWriting();
                            },
                            child: Text(
                              'رابط الكورس',
                              style: GoogleFonts.poppins(
                                  color: Colors.blue, fontSize: 18.sp),
                            ),
                          ),
                        ],
                      ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _launchUrlContentWriting() async {
    if (!await launchUrl(_urlContentWriting)) {
      throw 'Could not launch $_urlContentWriting';
    }
  }
}
