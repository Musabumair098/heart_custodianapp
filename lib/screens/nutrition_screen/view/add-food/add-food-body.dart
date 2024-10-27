import 'package:flutter/material.dart';
import 'package:heart_custodianapp/screens/nutrition_screen/view/add-food/widget/appbar.dart';
import 'package:heart_custodianapp/screens/nutrition_screen/view/add-food/widget/calorie-statistics.dart';
import 'package:heart_custodianapp/screens/nutrition_screen/view/add-food/widget/change-amount.dart';
import 'package:heart_custodianapp/screens/nutrition_screen/view/add-food/widget/food-image.dart';
class AddFoodBody extends StatelessWidget {

  const AddFoodBody({
    Key ? key
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        margin: EdgeInsets.only(right: 15, left: 15),
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: const [
            AddFoodScreenAppBar(),
            FoodImage(),
            CalorieStatistics(),
            ChangeAmount()
          ],
        ),
      ),
    );
  }
}