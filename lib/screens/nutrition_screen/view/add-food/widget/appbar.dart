import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:heart_custodianapp/screens/nutrition_screen/config/theme/theme.dart';
class AddFoodScreenAppBar extends StatelessWidget {
  const AddFoodScreenAppBar({
    Key ? key
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            height: 100,
            color: Colors.transparent,
            child: Row(
              children: [
                Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        color: AppColors.colorTint200,
                        borderRadius: BorderRadius.circular(15)
                    ),
                    child: Center(
                        child: Icon(
                          Icons.arrow_back,
                          color: AppColors.colorPrimary,
                          size: 25,
                        )
                    )
                ),
              ],
            ),
          ),
        ),
        Text(
          'Add new food',
          style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold
          ),
        ),
        InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            height: 100,
            color: Colors.transparent,
            child: Row(
              children: [
                Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        color: AppColors.colorTint200,
                        borderRadius: BorderRadius.circular(15)
                    ),
                    child: Center(
                      child: FaIcon(
                        FontAwesomeIcons.barcode,
                        size: 20,
                        color: AppColors.colorPrimary,
                      ),
                    )
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}