
import 'package:flutter/material.dart';
import 'package:heart_custodianapp/screens/nutrition_screen/config/theme/theme.dart';


class DailySummaryDetailScreenAppBar extends StatelessWidget {
  const DailySummaryDetailScreenAppBar({
    Key ? key
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pop(context);
      },
      child: Container(
        height: 100,
        color: Colors.transparent,
        child: Row(
          children: [
            Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    color: AppColors.colorTint200,
                    borderRadius: BorderRadius.circular(15)
                ),
                child: const Center(
                    child: Icon(
                      Icons.arrow_back,
                      color: AppColors.colorPrimary,
                      size: 25,
                    )
                )
            ),
          ],
        ),
      ),
    );
  }
}
