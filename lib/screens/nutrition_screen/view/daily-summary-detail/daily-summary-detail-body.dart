import 'package:flutter/material.dart';
import 'package:heart_custodianapp/screens/nutrition_screen/view/daily-summary-detail/widget/appbar.dart';
import 'package:heart_custodianapp/screens/nutrition_screen/view/daily-summary-detail/widget/date.dart';
import 'package:heart_custodianapp/screens/nutrition_screen/view/daily-summary-detail/widget/meals-consumed.dart';
import 'package:heart_custodianapp/screens/nutrition_screen/view/daily-summary-detail/widget/remaining-calorie.dart';


class DailySummaryDetailBody extends StatefulWidget {
  const DailySummaryDetailBody({
    super.key
  });

  @override
  State < DailySummaryDetailBody > createState() => _DailySummaryDetailBodyState();
}

class _DailySummaryDetailBodyState extends State < DailySummaryDetailBody > {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        margin: const EdgeInsets.only(right: 15, left: 15),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: const [
            DailySummaryDetailScreenAppBar(),
            Date(),
            MealsConsumed(),
            RemainingCalorie(),
          ],
        ),
      ),
    );
  }
}