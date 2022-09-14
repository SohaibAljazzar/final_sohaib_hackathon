import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../widgets/app_text_button.dart';

class AdsDetiles extends StatelessWidget {
  final Uri _url = Uri.parse('https://bit.ly/3a2Iuc6');
  List<Map<String, dynamic>> adsData = [
    {
      'image_url':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSI4UkuyTbxhVo148umbY8i05xc72GpNDaOow&usqp=CAU',
      'title': 'إعلان هام...!',
      'skill': 'تصميم ومونتاج',
      'location': 'غزة',
      'details':
          'حابب تعمل فيديو ممتع وشيق  وتضيف نص ثابت ومتحرك؟\nحابب تتعلم عمل مونتاج للفيديو بإستخدام برنامج البريمير بإحترافية ؟\nحابب تتعلم عمل تـأثيرات مميزة على الفيديو؟',
      'info':
          'يعلن تطبيق WINLANCE في حاضنتكم التكنولوجية عن بدء تقديم طلبات الالتحاق في البرنامج التدريبي الأول من نوعه والمتخصص في مجال التصميم والمونتاج المتنوعةإذا كنت شغوفاً في التصميم أو رساماً باهراً أوخريج تصميم فهذا التدريب مصمم خصيصاً لك! قدم طلبك الآن من خلال الرابط ⬇',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'تفاصيل الإعلانات',
          style: GoogleFonts.cairo(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              color: Colors.black),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 21.h),
        child: Column(
          children: [
            Center(
              child: Column(
                children: [
                  CachedNetworkImage(
                    height: 160.h,
                    width: double.infinity,
                    imageUrl: adsData[0]['image_url'],
                    imageBuilder: (context, imageProvider) => Container(
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
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
                  Text(
                    adsData[0]['skill'],
                    style: GoogleFonts.cairo(
                        fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  Text(adsData[0]['location'],
                      style: GoogleFonts.cairo(
                          fontSize: 16, fontWeight: FontWeight.w400)),
                ],
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('تفاصيل الإعلان:',
                      style: GoogleFonts.cairo(
                          fontSize: 16, fontWeight: FontWeight.w600)),
                  Text(
                    adsData[0]['details'],
                    style: GoogleFonts.cairo(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(' مزيد من المعلومات:',
                      style: GoogleFonts.cairo(
                          fontSize: 16, fontWeight: FontWeight.w600)),
                  Text(
                    adsData[0]['info'],
                    style: GoogleFonts.cairo(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            AppTextButton(
                text: 'الإعلان',
                onPressed: () {
                  _launchUrl();
                }),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw 'Could not launch $_url';
    }
  }
}
