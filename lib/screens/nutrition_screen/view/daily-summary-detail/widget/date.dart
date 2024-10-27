import 'package:flutter/material.dart';
import 'package:heart_custodianapp/screens/nutrition_screen/config/theme/theme.dart';

class Date extends StatelessWidget {
  const Date({ super.key });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top:10),
      child: const Column(
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
                  fontSize: 24,
                  fontWeight: FontWeight.bold
              ),
            )
          ]
      ),
    );
  }
}