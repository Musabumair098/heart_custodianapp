
import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:heart_custodianapp/screens/nutrition_screen/view/home/home_screen.dart';

import '../../config/theme/theme.dart';


class Nav extends StatefulWidget {
  static String routeName = '/nav';
  const Nav({
    Key ? key
  }): super(key: key);

  @override
  _NavState createState() => _NavState();
}



class _NavState extends State < Nav > {

  int _currentIndex = 0;

  void changePage(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
  final pages = [const HomeScreen(), Container(), Container(), Container(), Container()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_currentIndex],
      bottomNavigationBar: DotNavigationBar(
        currentIndex: _currentIndex,
        onTap: changePage,
        dotIndicatorColor: _currentIndex == 2 ? Colors.transparent : AppColors.colorPrimary,
        borderRadius: 0,
        backgroundColor: Colors.white,
        enablePaddingAnimation: false,
        marginR: EdgeInsets.zero,
        paddingR: EdgeInsets.zero,
        items: [
          DotNavigationBarItem(
              icon: const FaIcon(
                FontAwesomeIcons.house,
                size: 20,
              ),
              selectedColor: AppColors.colorPrimary,
              unselectedColor: AppColors.colorTint400
          ),
          DotNavigationBarItem(
              icon: const FaIcon(
                FontAwesomeIcons.search,
                size: 20,
              ),
              selectedColor: AppColors.colorPrimary,
              unselectedColor: AppColors.colorTint400
          ),
          DotNavigationBarItem(
            icon: Container(
              height: 48,
              width: 48,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.colorPrimary,
              ),
              child: const Center(
                child: FaIcon(
                  FontAwesomeIcons.barcode,
                  size: 20,
                ),
              ),
            ),
            selectedColor: Colors.white,
            unselectedColor: Colors.white,
          ),
          DotNavigationBarItem(
              icon: const FaIcon(
                FontAwesomeIcons.chartLine,
                size: 20,
              ),
              selectedColor: AppColors.colorPrimary,
              unselectedColor: AppColors.colorTint400
          ),
          DotNavigationBarItem(
              icon: const FaIcon(
                FontAwesomeIcons.user,
                size: 20,
              ),
              selectedColor: AppColors.colorPrimary,
              unselectedColor: AppColors.colorTint400
          ),
        ],
      ),
    );
  }
}