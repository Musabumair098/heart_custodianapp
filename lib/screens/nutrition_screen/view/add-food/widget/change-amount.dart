import 'package:flutter/material.dart';

import '../../../config/theme/theme.dart';
class ChangeAmount extends StatefulWidget {
  const ChangeAmount({
    Key ? key
  }): super(key: key);

  @override
  State < ChangeAmount > createState() => _ChangeAmountState();
}

class _ChangeAmountState extends State < ChangeAmount > {

  int amount = 160;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      margin: EdgeInsets.only(top: 30, left: 20, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 55,
            width: 140,
            padding: EdgeInsets.all(7),
            decoration: BoxDecoration(
                color: AppColors.colorTint200,
                borderRadius: BorderRadius.circular(20)
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      amount--;
                    });
                  },
                  child: Container(
                    width: 35,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: Column(
                      children: [
                        Icon(
                          Icons.minimize,
                          color: Colors.black,
                          size: 25,
                        ),
                      ],
                    ),
                  ),
                ),
                Text(
                  amount.toString() + 'g',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      amount++;
                    });
                  },
                  child: Container(
                    width: 35,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.add,
                          color: Colors.black,
                          size: 20,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 55,
            width: 140,
            padding: EdgeInsets.all(7),
            decoration: BoxDecoration(
                color: AppColors.colorPrimary,
                borderRadius: BorderRadius.circular(20)
            ),
            child: Center(
              child: Text(
                'Apply',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}