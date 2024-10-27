
import 'package:flutter/material.dart';
import 'package:heart_custodianapp/screens/nutrition_screen/view/add-food/add-food.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';


import '../../../config/theme/theme.dart';

class RemainingCalorie extends StatelessWidget {
  const RemainingCalorie({
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      margin: const EdgeInsets.only(bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 250,
            height: 40,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Remaining',
                      style: TextStyle(
                          color: AppColors.colorTint500,
                          fontSize: 15,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          '1,112',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        SizedBox(width: 5),
                        Text(
                          'kcal',
                          style: TextStyle(
                            color: AppColors.colorTint500,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                LinearPercentIndicator(
                  width: 250 ,
                  animation: true,
                  lineHeight: 6,
                  animationDuration: 2500,
                  percent: 0.8,
                  barRadius: const Radius.circular(3),
                  progressColor: AppColors.colorPrimary,
                  padding: EdgeInsets.zero,
                  backgroundColor: AppColors.colorTint600.withOpacity(0.2),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: (){
              Navigator.popAndPushNamed(context, AddFoodScreen.routeName);
            },
            child: Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                    color: AppColors.colorPrimary,
                    borderRadius: BorderRadius.circular(20)
                ),
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 27,
                )
            ),
          )
        ],
      ),
    );
  }
}
