import 'package:flutter/material.dart';
import 'package:heart_custodianapp/screens/nutrition_screen/config/theme/theme.dart';
import 'package:heart_custodianapp/screens/nutrition_screen/view/daily-summary-detail/daily-summary-detail.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
class DailySummary extends StatelessWidget {
  const DailySummary({
    Key ? key
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, DailySummaryDetailScreen.routeName);
      },
      child: AspectRatio(
        aspectRatio: 1.6,
        child: Container(
          padding: EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: AppColors.colorPrimary,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _circleProgress(),
              _macronutrients()

            ],
          ),
        ),
      ),
    );
  }

  Widget _circleProgress() {
    return SizedBox(
      width: 160,
      height: 160,
      child: Stack(
        children: [
          SizedBox(
            width: 160,
            height: 160,
            child: CircularProgressIndicator(
              strokeWidth: 8,
              value: 0.7,
              backgroundColor: AppColors.colorTint100.withOpacity(0.2),
              valueColor: AlwaysStoppedAnimation < Color > (Colors.white),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              width: double.infinity,
              height: double.infinity,
              margin: EdgeInsets.all(13),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.colorTint100.withOpacity(0.2), width: 8),
              ),
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.colorTint100.withOpacity(0.1),
                ),
                child: Container(
                  margin: EdgeInsets.all(22),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Remaining',
                        style: TextStyle(
                          color: AppColors.colorTint300,
                          fontSize: 12,
                        ),
                      ),
                      Text(
                        '1,112',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      Text(
                        'kcal',
                        style: TextStyle(
                          color: AppColors.colorTint300,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _macronutrients() {
    return Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _macronutrientsTile(title: 'Carbs', percentValue: 0.4, amountInGram: '14/323g'),
          _macronutrientsTile(title: 'Proteins', percentValue: 0.8, amountInGram: '14/129g'),
          _macronutrientsTile(title: 'Fats', percentValue: 0.2, amountInGram: '14/85g')
        ]
    );
  }

  Widget _macronutrientsTile({
    String ? title,
    double ? percentValue,
    String ? amountInGram
  }) {
    return SizedBox(
      height: 50,
      width: 120,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title!,
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
          ),
          LinearPercentIndicator(
            width: 120,
            animation: true,
            lineHeight: 6,
            animationDuration: 2500,
            percent: percentValue!,
            barRadius: Radius.circular(3),
            progressColor: Colors.white,
            padding: EdgeInsets.zero,
            backgroundColor: AppColors.colorTint100.withOpacity(0.2),
          ),
          Text(
            amountInGram!,
            style: TextStyle(
              color: Colors.white,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}