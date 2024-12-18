import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../core/resources/colors.dart';
import '../../core/resources/icons.dart';
import '../home/home_screen.dart';

class PagesScreen extends StatefulWidget {
  const PagesScreen({super.key});

  @override
  State<PagesScreen> createState() => _PagesScreenState();
}

class _PagesScreenState extends State<PagesScreen> {
  final navigationBarKey = GlobalKey();
  int selectedIndex = 0;
  late HomeScreen homeScreen;
  late List<Widget> pages;
  late Widget currentPage;

  @override
  void initState() {
    homeScreen = const HomeScreen();
    pages = [
      homeScreen
    ];
    currentPage = const HomeScreen();
    super.initState();
  }

  void itemTapped(int index) {
    setState(() {
      selectedIndex = index;
     // currentPage = pages[index];
      FocusScope.of(context).unfocus();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: currentPage,
      bottomNavigationBar: BottomNavigationBar(
          key: navigationBarKey,
          items:  <BottomNavigationBarItem>  [
            BottomNavigationBarItem(icon: _bottomNavIcons(icon: SvgIcons.homeIcon),
                label: "Home", activeIcon: _bottomNavIcons(icon:SvgIcons.homeIcon ,color: AppColors.primary,)),
            BottomNavigationBarItem(icon: _bottomNavIcons(icon:SvgIcons.saveIcon),
                label: "Save", activeIcon:  _bottomNavIcons(icon:SvgIcons.saveIcon, color: AppColors.primary,)),
            BottomNavigationBarItem(icon: _bottomNavIcons(icon: SvgIcons.portfolioIcon),
                label: "Portfolio", activeIcon:  _bottomNavIcons(icon: SvgIcons.portfolioIcon, color: AppColors.primary)),
            BottomNavigationBarItem(icon: _bottomNavIcons(icon: SvgIcons.rewardsIcon),
              label: "Rewards", activeIcon: _bottomNavIcons(icon: SvgIcons.rewardsIcon, color: AppColors.primary)),
            BottomNavigationBarItem(icon: _bottomNavIcons(icon: SvgIcons.accountIcon),
              label: "Account", activeIcon: _bottomNavIcons(icon: SvgIcons.accountIcon, color: AppColors.primary)),
          ],
          currentIndex: selectedIndex,
          onTap: itemTapped,
          type: BottomNavigationBarType.fixed,
          elevation: 4,
          selectedItemColor: AppColors.primary,
          unselectedItemColor: AppColors.black,
          unselectedLabelStyle: TextStyle(
             color: AppColors.black,
            fontSize: 11.sp,
            fontWeight: FontWeight.w500
          ),
          selectedLabelStyle: TextStyle(
            color: AppColors.primary,
            fontSize: 11.sp,
            fontWeight: FontWeight.w500
          ),
          backgroundColor: Colors.grey[100],
      )
    );
  }
  Widget _bottomNavIcons({required String icon, Color? color}){
    return SvgPicture.asset(
      icon,
      height: 23,
      width: 23,
      color: color
    );
  }
}