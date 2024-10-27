import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:heart_custodianapp/screens/nutrition_screen/config/theme/theme.dart';

class DailyCalorieStatistics extends StatelessWidget {
  const DailyCalorieStatistics({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2,
      child: Container(
        margin: const EdgeInsets.only(top: 18),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: statisticsTile(
                title: 'Intake',
                icon: const FaIcon(
                  FontAwesomeIcons.pizzaSlice,
                  color: Colors.orange,
                ),
                progressColor: AppColors.colorAccent,
                value: 589,
                progressPercent: 0.4,
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Expanded(
              child: statisticsTile(
                title: 'Burned',
                icon: const FaIcon(
                  FontAwesomeIcons.fire,
                  color: Colors.red,
                ),
                progressColor: Colors.redAccent,
                value: 738,
                progressPercent: 0.7,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget statisticsTile({
    required String title,
    required FaIcon icon,
    required Color progressColor,
    required int value,
    required double progressPercent,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            icon,
            const SizedBox(width: 8),
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        const SizedBox(height: 8),
        SizedBox(
          width: double.infinity, // This ensures the progress bar fills the available width
          child: LinearProgressIndicator(
            value: progressPercent,
            color: progressColor,
            backgroundColor: Colors.grey[300],
          ),
        ),
        const SizedBox(height: 4),
        Text(
          '$value kcal',
          style: const TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}
