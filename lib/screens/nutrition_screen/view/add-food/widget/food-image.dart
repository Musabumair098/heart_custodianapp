import 'package:flutter/material.dart';
class FoodImage extends StatelessWidget {
  const FoodImage({
    Key ? key
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 230,
      margin: EdgeInsets.only(top: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
      ),
      child: Stack(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Image.asset('assets/images/pasta (1).jpg', fit: BoxFit.cover, height: 230, width: double.infinity, )
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
                margin: const EdgeInsets.only(left: 15, bottom: 20, ),
                child: const Text(
                  'Pasta with tomato sauce',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 22
                  ),
                )
            ),
          )
        ],
      ),
    );
  }
}