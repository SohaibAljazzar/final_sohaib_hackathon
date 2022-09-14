import 'package:final_sohaib_hackathon/prefs/shared_pref_controller.dart';
import 'package:final_sohaib_hackathon/screens/auth/login_screen.dart';
import 'package:flutter/material.dart';

import '../../value/colors.dart';
import '../../widgets/on_boarding_content.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  late PageController _pageController;
  int _curruntIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: PageView(
              physics: const BouncingScrollPhysics(),
              controller: _pageController,
              onPageChanged: (int curruntPage) {
                // print('Currunt Page : $curruntPage');
                setState(() {
                  _curruntIndex = curruntPage;
                });
              },
              children: const [
                OnBoardingContent(
                  imageUrl: 'onBoarding_1',
                  title: 'يا مرحبا',
                  subTitle: ' أهلاً بك أيها الفائز معنا في تطبيقنا👋✨',
                ),
                OnBoardingContent(
                    imageUrl: 'onBoarding_2',
                    title: 'عن التطبيق',
                    subTitle:
                        'WINLANCE تطبيق تعليمي تشبيكي مجاني يقدم لك أفضل الدورات التقنية للارتقاء بك'),
                OnBoardingContent(
                    imageUrl: 'onBoarding_3',
                    title: 'مميزات التطبيق',
                    subTitle:
                        '- عرض جميع الدورات التدريبية الخاصة بالمهارات التقنية\n- إنشاء معرض أعمال لكل فريلانسر\n- التشبيك مع جميع منصات العمل الحر')
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                TabPageSelectorIndicator(
                  backgroundColor: _curruntIndex == 0
                      ? AppColors.appColor
                      : const Color(0xFFEADDC3),
                  borderColor: Colors.transparent,
                  size: _curruntIndex == 0 ? 18 : 12,
                ),
                TabPageSelectorIndicator(
                  backgroundColor: _curruntIndex == 1
                      ? AppColors.appColor
                      : const Color(0xFFEADDC3),
                  borderColor: Colors.transparent,
                  size: _curruntIndex == 1 ? 18 : 12,
                ),
                TabPageSelectorIndicator(
                  backgroundColor: _curruntIndex == 2
                      ? AppColors.appColor
                      : const Color(0xFFEADDC3),
                  borderColor: Colors.transparent,
                  size: _curruntIndex == 2 ? 18 : 12,
                ),
                const Spacer(),
                FloatingActionButton(
                  backgroundColor: AppColors.appColor,
                  onPressed: () {
                    if (_curruntIndex < 2) {
                      _pageController.nextPage(
                          duration: const Duration(seconds: 1),
                          curve: Curves.easeInOutBack);
                    } else {
                      SharedPrefController()
                          .setDataByKey(key: 'first', value: '1');
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginScreen()));
                    }
                  },
                  child: const Icon(
                    Icons.arrow_forward_rounded,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 100,
          ),
        ],
      ),
    );
  }
}
