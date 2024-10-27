import 'package:flutter/material.dart';
import 'package:heart_custodianapp/screens/nutrition_screen/view/add-food/add-food.dart';
import 'package:heart_custodianapp/screens/nutrition_screen/view/daily-summary-detail/daily-summary-detail.dart';
import 'package:heart_custodianapp/screens/nutrition_screen/view/home/widgets/appbar.dart';
import 'package:heart_custodianapp/screens/nutrition_screen/view/home/widgets/daily-calorie-statistics.dart';
import 'package:heart_custodianapp/screens/nutrition_screen/view/home/widgets/daily-summary.dart';
import 'package:heart_custodianapp/screens/nutrition_screen/view/home/widgets/meal-consumed.dart';



class HomeScreen extends StatelessWidget {
  static String routeName = '/home';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        margin: const EdgeInsets.only(right: 15, left: 15),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            const HomeScreenAppBar(),
            const DailySummary(),
            const DailyCalorieStatistics(),
            const MealConsumed(
              mealAmount: '',
              progressValue: 50,
              mealName: '',
              consumedFoods: [],
            ),
            // Adding buttons below breakfast section
            const SizedBox(height: 20), // Adding some space before buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>  AddFoodScreen()),
                    );



                    // Handle add meal action
                  },
                  child: const Text("Add Meal"),
                ),
                ElevatedButton(
                  onPressed: () {

                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>  DailySummaryDetailScreen()),
                    );


                    // Handle view details action
                  },
                  child: const Text("View Details"),
                ),
              ],
            ),
            const SizedBox(height: 20), // Adding space after buttons
          ],
        ),
      ),
    );
  }
}
