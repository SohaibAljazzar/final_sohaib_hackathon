import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:final_sohaib_hackathon/firebase/fb_auth_controller.dart';
import 'package:final_sohaib_hackathon/value/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../taps/freelancer_taps.dart';
import '../taps/home_tap.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF5F5F5),
      appBar: AppBar(
        toolbarHeight: 100.h,
        backgroundColor: AppColors.appColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(20),
              bottomLeft: Radius.circular(20)),
        ),
        title: const Text(
          'Home',
          style: TextStyle(fontSize: 16, color: Colors.white),
        ),
        leading: IconButton(
            onPressed: () {
              showDialogInfo();
            },
            icon: const Icon(
              Icons.logout_outlined,
              color: Colors.white,
            )),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
            child: TabBar(
              // isScrollable: true,
              indicatorWeight: 2,
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorPadding: EdgeInsets.zero,
              indicator: BoxDecoration(
                color: AppColors.appColor,
                borderRadius: BorderRadius.circular(10),
              ),
              labelColor: Colors.white,
              labelStyle: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w700,
              ),
              unselectedLabelColor: AppColors.appColor,
              unselectedLabelStyle: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w700,
              ),
              padding: const EdgeInsets.only(top: 10),
              controller: _tabController,
              tabs: const [
                Tab(
                  text: 'الشاشة الرئيسية',
                ),
                Tab(text: 'صاحب المهارة'),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [MainScreen(), FreelancerScreen()],
            ),
          ),
        ],
      ),
    );
  }

  void showDialogInfo() {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.QUESTION,
      borderSide: BorderSide(
        color: Colors.red,
        width: 2.r,
      ),
      width: 400.w,
      buttonsBorderRadius: BorderRadius.all(
        Radius.circular(2.r),
      ),
      dismissOnTouchOutside: true,
      dismissOnBackKeyPress: false,
      onDissmissCallback: (type) {},
      headerAnimationLoop: false,
      animType: AnimType.BOTTOMSLIDE,
      title: 'هل تريد تسجيل الخروج؟',
      desc: 'انت على وشك تسجيل الخروج !',
      showCloseIcon: true,
      btnCancelOnPress: () {},
      btnOkOnPress: () async {
        FbAuthController().signOut();
        Navigator.pushReplacementNamed(context, '/login_screen');
      },
      btnCancelText: 'اغلاق',
      btnOkText: 'حسنا',
    ).show();
  }
}
