import 'package:cached_network_image/cached_network_image.dart';
import 'package:final_sohaib_hackathon/screens/app/admin/course_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../value/colors.dart';
import '../../widgets/custom_text_filed.dart';
import '../../widgets/home_section.dart';

class MainScreen extends StatelessWidget {
  final Uri _urlContentWriting =
      Uri.parse('https://www.youtube.com/watch?v=zs3PiS1t13g');
  final Uri _urlGraphic =
      Uri.parse('https://www.youtube.com/watch?v=ALAMNStG-EQ');
  final Uri _urlTranslate =
      Uri.parse('https://www.youtube.com/watch?v=90k18u9C_ys');
  final Uri _urlMarketing =
      Uri.parse('https://www.youtube.com/watch?v=LRighM6rXwQ');
  List<Map<String, dynamic>> adsData = [
    {
      'image_url':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSI4UkuyTbxhVo148umbY8i05xc72GpNDaOow&usqp=CAU',
      'title': 'إعلان هام...!',
      'skill': 'تصميم ومونتاج',
    },
    {
      'image_url':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQIoGIJWCiZACMGiTKZo9ge9tmnO254BoI7Fw&usqp=CAU',
      'title': 'إعلان هام...!',
      'skill': 'تسويق الكتروني',
    },
    {
      'image_url':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTc6ONSZOEVEQUTqSCxCRcZfFLbTwSY1URddw&usqp=CAU',
      'title': 'إعلان هام...!',
      'skill': 'الترجمة والعمل الحر',
    },
  ];
  List<Map<String, dynamic>> blogData = [
    {
      'title': 'خوارزميات تحويل فورييه السريع Fast Fourier Transform',
      'image_url':
          'https://academy.hsoub.com/uploads/monthly_2022_08/62fb40a1ae3dd_------.png.7d3c0cb73f591047b8a7b62e25c08583.png',
      'description':
          'لعلّ أبسط طرق حساب تحويل فورييه السريع FFT وأشهرها هي خوارزمية التعشير الزمني من الأساس 2 أي Radix-2 Decimation in Time، وينبني عمل هذه الخوارزمية على تفكيك إشارة معيّنة ذات نطاق زمني مؤلف من N نقطة إلى N إشارة أحادية (أي ذات نطاق زمني مؤلف من نقطة واحدة).',
    },
    {
      'title': 'تنفيذ أسلوب البحث بالعمق أولا باستخدام الواجهتين Iterables  ',
      'image_url':
          'https://academy.hsoub.com/uploads/monthly_2021_11/61a14e9c54135_-------Iterables--Iterators.png.62f146cb7054050ae72e4d9944d87756.png',
      'description':
          'ربما تعتقد أن إعادة كتابة تابع جيد فعليًا باستخدام صنفين، وأن خمسة توابع تُعَد فكرةً غير جديرة بالاهتمام. ولكننا وقد فعلنا ذلك الآن، أصبح بإمكاننا أن نَستخدِم الصنف WikiNodeIterable في أي مكانٍ يُمكِننا فيه استخدام النوع Iterable. يُسهِّل ذلك من الفصل بين منطق التنفيذ التكراري (البحث بالعمق أولًا) وبين المعالجة التي نريد إجراءها على العقد.',
    },
  ];
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
    {
      'publisher_name': 'Sohaib Aljazzar',
      'course_image_url':
          'https://graphic-academy.com/wp-content/uploads/2019/01/مهارات-واسس-تصميم-الجرافيك.jpg',
      'title': 'التصميم الجرافيكي',
      'course_link': 'https://www.youtube.com/watch?v=ALAMNStG-EQ',
      'description':
          'محاضرات للتدريب على تصميم بوستات السوشيال ميديا والهوية البصرية والشعارات.',
    },
    {
      'publisher_name': 'Sohaib Aljazzar',
      'course_image_url':
          'https://d3vt78ic2w6yaz.cloudfront.net/fit-1000-545/blog/46-e4555e101---110-08.webp',
      'title': 'الترجمة',
      'course_link': 'https://www.youtube.com/watch?v=90k18u9C_ys',
      'description': 'تعلم كيفية الترجمة من اللغة العربية للانجليزية والعكس.',
    },
    {
      'publisher_name': 'Sohaib Aljazzar',
      'course_image_url': 'https://i.ytimg.com/vi/_6iICMsZmjo/hqdefault.jpg',
      'title': 'تسويق السوشيال ميديا',
      'course_link': 'https://www.youtube.com/watch?v=LRighM6rXwQ',
      'description':
          'تعلم كتابة الخطط التسويقية بالإضافة عمل صفحات على المواقع والنشر عليها،وإضافة الإعلانات..',
    },
  ];

  MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        HomeSection(
            title: 'إعلانات',
            textButton: 'إضافة إعلان',
            onPressed: () {
              showAlertDialog2(context);
            }),
        ConstrainedBox(
          constraints: const BoxConstraints(maxHeight: 130),
          child: GridView.builder(
            itemCount: adsData.length,
            scrollDirection: Axis.horizontal,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              mainAxisSpacing: 10,
              // mainAxisExtent: 90,
              childAspectRatio: 90 / 230,
            ),
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 15,
                ),
                child: Card(
                  // color: Color(0xffffffff),
                  // decoration: BoxDecoration(
                  //   color: Colors.white,
                  //   borderRadius: BorderRadius.circular(20.r),
                  // ),
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.r)),
                  child: Row(
                    children: [
                      CachedNetworkImage(
                        height: 60.h,
                        width: 60.w,
                        imageUrl: adsData[index]['image_url'],
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
                      SizedBox(
                        width: 20.w,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              adsData[index]['title'],
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w400, fontSize: 16.sp),
                            ),
                            Text(
                              adsData[index]['skill'],
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500, fontSize: 18.sp),
                            ),
                          ],
                        ),
                      ),
                      Spacer(),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/ads_details');
                        },
                        style: ElevatedButton.styleFrom(
                            primary: AppColors.appColor),
                        child: Text(
                          'تفاصيل الإعلان',
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w700, fontSize: 14.sp),
                        ),
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        HomeSection(title: 'تقارير', onPressed: () {}),
        ConstrainedBox(
          constraints: const BoxConstraints(maxHeight: 345),
          child: GridView.builder(
            itemCount: blogData.length,
            scrollDirection: Axis.horizontal,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              mainAxisSpacing: 10,
              mainAxisExtent: 270,
            ),
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 15,
                ),
                child: Container(
                  // color: Color(0xffffffff),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // padding: const EdgeInsets.only(top: 5,bottom: 5,right: 5),

                          CachedNetworkImage(
                            height: 128.h,
                            width: double.infinity,
                            imageUrl: blogData[index]['image_url'],
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
                            padding: EdgeInsets.all(8.r),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  blogData[index]['title'],
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 14.sp),
                                ),
                                Text(
                                  blogData[index]['description'],
                                  style: GoogleFonts.poppins(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w400,
                                      textBaseline: TextBaseline.alphabetic),
                                  maxLines: 5,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        HomeSection(
            title: 'دورات تدريبية',
            textButton: 'إضافة دورة',
            onPressed: () {
              showAlertDialog(context);
            }),
        ConstrainedBox(
          constraints: const BoxConstraints(maxHeight: 300),
          child: GridView.builder(
            itemCount: courseData.length,
            scrollDirection: Axis.horizontal,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              mainAxisSpacing: 10,
              mainAxisExtent: 250,
              childAspectRatio: 150 / 190,
            ),
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 15,
                ),
                child: Container(
                  // color: Color(0xffffffff),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(8.r),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // padding: const EdgeInsets.only(top: 5,bottom: 5,right: 5),

                        CachedNetworkImage(
                          height: 128.h,
                          width: 300.w,
                          imageUrl: courseData[index]['course_image_url'],
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
                        Text(
                          courseData[index]['title'],
                          style: GoogleFonts.poppins(fontSize: 14),
                        ),
                        Text(
                          courseData[index]['description'],
                          style: GoogleFonts.poppins(
                              fontSize: 10, fontWeight: FontWeight.w400),
                        ),
                        Spacer(),
                        Row(
                          children: [
                            Icon(
                              Icons.link,
                              color: Colors.blue,
                              size: 16.sp,
                            ),
                            TextButton(
                              onPressed: () {
                                if (courseData[index]['title'] ==
                                    'كتابة المحتوى') {
                                  _launchUrlContentWriting();
                                } else if (courseData[index]['title'] ==
                                    'التصميم الجرافيكي') {
                                  _launchUrlGraphic();
                                } else if (courseData[index]['title'] ==
                                    'الترجمة') {
                                  _launchUrlTranslate();
                                } else if (courseData[index]['title'] ==
                                    'تسويق السوشيال ميديا') {
                                  _launchUrlMarketing();
                                }
                              },
                              child: Text(
                                'رابط الكورس',
                                style: GoogleFonts.poppins(
                                    color: Colors.blue, fontSize: 14.sp),
                              ),
                            ),
                            Spacer(),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => CourseDetails(),
                                    ));
                              },
                              child: Text(
                                'عرض المزيد',
                                style: GoogleFonts.poppins(
                                    color: Colors.grey, fontSize: 14.sp),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Future<void> _launchUrlContentWriting() async {
    if (!await launchUrl(_urlContentWriting)) {
      throw 'Could not launch $_urlContentWriting';
    }
  }

  Future<void> _launchUrlGraphic() async {
    if (!await launchUrl(_urlGraphic)) {
      throw 'Could not launch $_urlGraphic';
    }
  }

  Future<void> _launchUrlTranslate() async {
    if (!await launchUrl(_urlTranslate)) {
      throw 'Could not launch $_urlTranslate';
    }
  }

  Future<void> _launchUrlMarketing() async {
    if (!await launchUrl(_urlMarketing)) {
      throw 'Could not launch $_urlMarketing';
    }
  }

  void showAlertDialog(BuildContext context) {
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
                  'إضافة كورس',
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
                      'اسم الكورس',
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
                      hintText: 'أدخل اسم الإعلان',
                      textInputType: TextInputType.text,
                    ),
                    Text(
                      'عدد الساعات',
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
                      hintText: '20 ساعة',
                      textInputType: TextInputType.datetime,
                    ),
                    Text(
                      'اسم المدرب',
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
                      hintText: 'أدخل اسم المدرب',
                      textInputType: TextInputType.text,
                    ),
                    Text(
                      'تفاصيل الكورس',
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
                      'رابط الكورس',
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
                      'صورة تعريفية الكورس',
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

  void showAlertDialog2(BuildContext context) {
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
                  'إضافة إعلان',
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
                      'اسم الإعلان',
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
                      hintText: 'أدخل اسم الإعلان',
                      textInputType: TextInputType.text,
                    ),
                    Text(
                      'تاريخ البداية',
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
                      hintText: 'اختر تاريخ بداية الإعلان',
                      textInputType: TextInputType.datetime,
                      suffix: Icons.calendar_today_outlined,
                    ),
                    Text(
                      'وقت البداية',
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
                      hintText: 'اختر توقيت بداية الإعلان',
                      textInputType: TextInputType.text,
                      suffix: Icons.timer_outlined,
                    ),
                    Text(
                      'تفاصيل الإعلان',
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
                      'الموقع',
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
                      hintText: 'أدخل موقعك',
                      textInputType: TextInputType.text,
                    ),
                    Text(
                      'اسم الشركة',
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
                      hintText: 'أدخل اسم الشركة',
                      textInputType: TextInputType.text,
                    ),
                    Text(
                      'رابط موقع الشركة',
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
                    ),
                    Text(
                      'صورة الإعلان',
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
                      hintText: 'أدخل اسم الشركة',
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
