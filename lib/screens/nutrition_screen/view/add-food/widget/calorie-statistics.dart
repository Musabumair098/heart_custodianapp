import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../../config/theme/theme.dart'; // Ensure this import is correct if you have custom theme definitions

class CalorieStatistics extends StatelessWidget {
  const CalorieStatistics({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AspectRatio(
          aspectRatio: 2,
          child: Container(
            margin: const EdgeInsets.only(top: 18),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _calorieStatistics(),
                const SizedBox(width: 15),
                statisticsTile(
                  title: 'Carbs',
                  icon: const FaIcon(
                    FontAwesomeIcons.pizzaSlice,
                    color: Colors.amber,
                  ),
                  progressColor: Colors.amber,
                  unitName: 'grams',
                  value: 23.50,
                  progressPercent: 0.7,
                ),
              ],
            ),
          ),
        ),
        AspectRatio(
          aspectRatio: 2,
          child: Container(
            margin: const EdgeInsets.only(top: 18),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                statisticsTile(
                  title: 'Proteins',
                  icon: const FaIcon(
                    FontAwesomeIcons.pizzaSlice,
                    color: Colors.blue,
                  ),
                  progressColor: Colors.blue,
                  unitName: 'grams',
                  value: 6.0,
                  progressPercent: 0.4,
                ),
                const SizedBox(width: 15),
                statisticsTile(
                  title: 'Fats',
                  icon: const FaIcon(
                    FontAwesomeIcons.fire,
                    color: Colors.red,
                  ),
                  progressColor: Colors.red,
                  unitName: 'grams',
                  value: 4.1,
                  progressPercent: 0.2,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _calorieStatistics() {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: AppColors.colorPrimary, // Make sure AppColors is defined in your theme
          borderRadius: BorderRadius.circular(25),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Calories',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                FaIcon(
                  FontAwesomeIcons.fire,
                  color: Colors.orange,
                ),
              ],
            ),
            Row(
              children: [
                RotatedBox(
                  quarterTurns: -1,
                  child: LinearPercentIndicator(
                    width: 60, // Removed the `.w`
                    animation: true,
                    lineHeight: 6,
                    animationDuration: 2500,
                    percent: 0.6,
                    barRadius: const Radius.circular(3),
                    progressColor: Colors.white,
                    padding: EdgeInsets.zero,
                    backgroundColor: AppColors.colorTint400.withOpacity(0.4),
                  ),
                ),
                const SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      '149',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'kcal',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Implement the statisticsTile function to return a widget
  Widget statisticsTile({
    required String title,
    required FaIcon icon,
    required MaterialColor progressColor,
    required String unitName,
    required double value,
    required double progressPercent,
  }) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: progressColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon,
          const SizedBox(height: 5),
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5),
          Text(
            '$value $unitName',
            style: const TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: 5),
          LinearPercentIndicator(
            width: 100,
            animation: true,
            lineHeight: 6,
            animationDuration: 2500,
            percent: progressPercent,
            barRadius: const Radius.circular(3),
            progressColor: progressColor,
            padding: EdgeInsets.zero,
            backgroundColor: Colors.grey.withOpacity(0.3),
          ),
        ],
      ),
    );
  }
}
