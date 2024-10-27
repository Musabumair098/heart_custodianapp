
import 'package:flutter/material.dart';
import 'package:heart_custodianapp/screens/nutrition_screen/view/add-food/add-food-body.dart';
class AddFoodScreen extends StatelessWidget {

  static String routeName = '/addfood';
  const AddFoodScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AddFoodBody();
  }
}