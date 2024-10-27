import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:heart_custodianapp/screens/nutrition_screen/config/theme/theme.dart';
import 'package:heart_custodianapp/screens/nutrition_screen/model/food-consumed.dart';
class MealConsumed extends StatefulWidget {
  const MealConsumed({
    Key ? key, required String mealAmount, required String mealName, required int progressValue, required List<FoodConsumed> consumedFoods
  }): super(key: key);

  get progressValue => null;

  get mealAmount => null;

  String? get mealName => null;

  @override
  State < MealConsumed > createState() => _MealConsumedState();
}

class _MealConsumedState extends State < MealConsumed > {
  List < FoodConsumed > consumedFoods = [];
  @override
  void didChangeDependencies() {
    provideConsumedFoods();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: double.infinity,
      ),
      child: Container(
        margin: EdgeInsets.only(top: 30, bottom: 30),
        padding: EdgeInsets.only(left: 10),
        child: Column(
          children: [
            SizedBox(
              height: 40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        height: 25,
                        width: 25,
                        child: CircularProgressIndicator(
                          strokeWidth: 4,
                          value: 0.7,
                          backgroundColor: AppColors.colorAccent.withOpacity(0.2),
                          valueColor: AlwaysStoppedAnimation < Color > (AppColors.colorAccent),
                        ),
                      ),
                      SizedBox(width: 20),
                      Text(
                        'Breakfast',
                        style: TextStyle(
                          color: AppColors.colorTint700,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        '407',
                        style: TextStyle(
                          color: AppColors.colorTint500,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(width: 1),
                      Text(
                        'kcal',
                        style: TextStyle(
                          color: AppColors.colorTint500,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            ListView.builder(
              itemCount: consumedFoods.length,
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: 70,
                  margin: EdgeInsets.zero,
                  child: IntrinsicHeight(
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            VerticalDivider(
                              color: AppColors.colorTint300,
                              thickness: 2,
                            ),
                            SizedBox(width: 15),
                            Container(
                              height: 54,
                              width: 54,
                              decoration: BoxDecoration(
                                  color: consumedFoods[index].boxColor,
                                  borderRadius: BorderRadius.circular(20)
                              ),
                              child: Center(
                                  child: consumedFoods[index].icon
                              ),
                            ),
                            SizedBox(width: 15),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  consumedFoods[index].foodName!,
                                  style: TextStyle(
                                      color: AppColors.colorTint700,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  consumedFoods[index].consumedAmount!,
                                  style: TextStyle(
                                    color: AppColors.colorTint500,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            )
                          ]
                      )
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }


  void provideConsumedFoods() {
    consumedFoods.add(
        FoodConsumed(
          foodName: 'Espresso coffe',
          consumedAmount: '30 ml',
          boxColor: AppColors.colorTint200,
          icon: SvgPicture.asset(
              'assets/icons/tea.svg',
              width: 25,
              height: 25,
          ),
        )
    );

    consumedFoods.add(
        FoodConsumed(
          foodName: 'Croissant',
          consumedAmount: '100 ml',
          boxColor: AppColors.colorErrorLight,
          icon:SvgPicture.asset(
              'assets/icons/croissant.svg',
              width: 25,
              height: 25,
          ),
        )
    );
  }
}