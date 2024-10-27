import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:heart_custodianapp/screens/nutrition_screen/config/theme/theme.dart';
import 'package:heart_custodianapp/screens/nutrition_screen/model/food-consumed.dart';
import 'package:heart_custodianapp/screens/nutrition_screen/view/home/widgets/meal-consumed.dart';

class MealsConsumed extends StatefulWidget {
  const MealsConsumed({super.key});

  @override
  State<MealsConsumed> createState() => _MealsConsumedState();
}

class _MealsConsumedState extends State<MealsConsumed> {
  List<MealConsumed> mealsConsumed = [];

  @override
  void initState() {
    super.initState();
    provideMealsConsumed(); // Call method in initState
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: mealsConsumed.length,
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.only(bottom: 15), // Use ScreenUtil for bottom padding
      itemBuilder: (BuildContext context, int index) {
        return mealConsumedTile(mealsConsumed[index]);
      },
    );
  }

  void provideMealsConsumed() {
    mealsConsumed.add(
      MealConsumed(
        mealAmount: '407',
        mealName: 'Breakfast',
        progressValue: 50, // Ensure this is a double
        consumedFoods: [
          FoodConsumed(
            foodName: 'Espresso coffee',
            consumedAmount: '30 ml',
            boxColor: AppColors.colorTint200,
            icon: SvgPicture.asset(
              'assets/icons/tea.svg',
              width: 25,
              height: 25,
            ),
          ),
          FoodConsumed(
            foodName: 'Croissant',
            consumedAmount: '100 g',
            boxColor: AppColors.colorErrorLight,
            icon: SvgPicture.asset(
              'assets/icons/croissant.svg',
              width: 25,
              height: 25,
            ),
          ),
        ],
      ),
    );

    mealsConsumed.add(
      MealConsumed(
        mealAmount: '352',
        mealName: 'Lunch',
        progressValue: 70, // Ensure this is a double
        consumedFoods: [
          FoodConsumed(
            foodName: 'Chicken breast',
            consumedAmount: '200 g',
            boxColor: AppColors.colorTint200,
            icon: SvgPicture.asset(
              'assets/icons/chicken.svg',
              width: 25,
              height: 25,
            ),
          ),
          FoodConsumed(
            foodName: 'Green salad',
            consumedAmount: '100 g',
            boxColor: AppColors.colorErrorLight,
            icon: SvgPicture.asset(
              'assets/icons/salad.svg',
              width: 25,
              height: 25,
            ),
          ),
        ],
      ),
    );

    mealsConsumed.add(
      MealConsumed(
        mealAmount: '635',
        mealName: 'Dinner',
        progressValue: 30, // Ensure this is a double
        consumedFoods: [
          FoodConsumed(
            foodName: 'Pasta with tomato sauce',
            consumedAmount: '160 g',
            boxColor: AppColors.colorTint200,
            icon: SvgPicture.asset(
              'assets/icons/pasta.svg',
              width: 25,
              height: 25,
            ),
          ),
        ],
      ),
    );

    setState(() {}); // Update the UI after adding meals
  }

  Widget mealConsumedTile(MealConsumed meal) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10.h),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'meal.mealName', // Display the meal name
              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text('Amount: ${meal.mealAmount} kcal'),
            LinearProgressIndicator(value: meal.progressValue / 100), // Display progress
          ],
        ),
      ),
    );
  }
}
