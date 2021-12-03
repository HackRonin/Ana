import 'package:ana/app/config/app_color.dart';
import 'package:ana/app/config/app_text_styles.dart';
import 'package:ana/presentation/controllers/bottom_nav_controller.dart';
import 'package:ana/presentation/features/home/home_screen.dart';
import 'package:ana/presentation/features/links/links_screen.dart';
import 'package:ana/presentation/features/more/more_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class BottomNavScreen extends StatelessWidget{
  const BottomNavScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomNavController>(
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            toolbarHeight: 61.h,
            shadowColor: Colors.white.withOpacity(0.6),
            backgroundColor: Colors.white,
            title: Padding(
              padding: EdgeInsets.only(left: 29.w),
              child: Text('Hello Elon', style: GoogleFonts.mulish(
                fontSize: 13.sp,
                fontWeight: FontWeight.w300,
                color: Colors.black
              ),),
            ),
            actions: [
              IconButton(
                  tooltip: 'Notifications',
                  onPressed: (){},
                  icon:SvgPicture.asset('assets/icons/bell.svg'), iconSize: 24, )
            ],
          ),
          body: SafeArea(
            child: IndexedStack(
              index: controller.tabIndex,
              children: const [
                HomeScreen(),
               LinksScreen(),
              MoreScreen(),
              ],
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            unselectedItemColor: AppColor.primaryDark.withOpacity(0.5),
            selectedItemColor: AppColor.primaryDark,
            onTap: controller.changeTabIndex,
            unselectedLabelStyle: AppTextStyles.labelStyleUnSelected,
            selectedLabelStyle: AppTextStyles.labelStyleSelected,
            currentIndex: controller.tabIndex,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            elevation: 0,
            items: [
              BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/icons/home.svg',
                  color: controller.tabIndex == 1 ? AppColor.primaryDark : AppColor.primaryDark.withOpacity(0.5),
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/icons/links.svg',
                  color: controller.tabIndex == 1 ? AppColor.primaryDark : AppColor.primaryDark.withOpacity(0.5),
                ),
                label: 'Links',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/icons/more.svg',
                  color: controller.tabIndex == 1 ? AppColor.primaryDark : AppColor.primaryDark.withOpacity(0.5),
                ),
                label: 'More',
              ),
            ],
          ),
        );
      },
    );

  }
  // _bottomNavigationBarItem({required Icon icon, required String label}) {
  //   return BottomNavigationBarItem(
  //     icon: icon,
  //     label: label,
  //
  //
  //   );
  // }

}