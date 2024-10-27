import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:heart_custodianapp/screens/nutrition_screen/config/theme/theme.dart';
class HomeScreenAppBar extends StatelessWidget {
  const HomeScreenAppBar({
    Key ? key
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      color: Colors.transparent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Today',
                  style: TextStyle(
                      color: AppColors.colorTint500,
                      fontSize: 14,
                      fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(height: 7),
                Text(
                  'Wed, 18 Aug',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold
                  ),
                )
              ]
          ),
          Container(
              height: 45,
              width: 45,
              decoration: BoxDecoration(
                  color: AppColors.colorTint200,
                  borderRadius: BorderRadius.circular(15)
              ),
              child: Center(
                child: SvgPicture.asset(
                    'assets/icons/calendar.svg',
                    color: AppColors.colorPrimary,
                    width: 25,
                    height: 25,
                ),
              )
          ),
        ],
      ),
    );
  }
}