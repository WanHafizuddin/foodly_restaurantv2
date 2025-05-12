import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant_app/common/app_style.dart';
import 'package:restaurant_app/common/background_container.dart';
import 'package:restaurant_app/common/reusable_text.dart';
import 'package:restaurant_app/constants/constant.dart';
import 'package:restaurant_app/views/food/food_tile.dart';

class FoodList extends StatelessWidget {
  const FoodList({super.key});

  @override
  Widget build(BuildContext context) {

    final List<Map<String, dynamic>> foods = [
      {
        "title": "Tiramisu",
        "time": "35 min",
        "price": 7.99,
        "additives": [
          {"title": "Ladyfingers"},
          {"title": "Coffee"},
          {"title": "Mascarpone Cheese"},
          {"title": "Cocoa"},
          {"title": "Sugar"},
        ]
      },
      {
        "title": "Spaghetti Carbonara",
        "time": "20 min",
        "price": 14.99,
        "additives": [
          {"title": "Egg"},
          {"title": "Pancetta"},
          {"title": "Parmesan Cheese"},
          {"title": "Black Pepper"},
          {"title": "Pasta"},
        ]
      },
      {
        "title": "Vegan Salad Bowl",
        "time": "55 min",
        "price": 11.99,
        "additives": [
          {"title": "Mixed Greens"},
          {"title": "Walnuts"},
          {"title": "Quinoa"},
          {"title": "Cherry Tomatoes"},
          {"title": "Vinaigrette"},
        ]
      },
      {
        "title": "Margherita Pizza",
        "time": "30 min",
        "price": 12.99,
        "additives": [
          {"title": "Cheese"},
          {"title": "Pepperoni"},
          {"title": "Ketch up"},
        ]
      },
      {
        "title": "Tropical Fruit Smoothie",
        "time": "25 min",
        "price": 6.99,
        "additives": [
          {"title": "Mango"},
          {"title": "Pineapple"},
          {"title": "Banana"},
          {"title": "Coconut milk"},
          {"title": "Ice"},
        ]
      },
      {
        "title": "Mixed Grill Platter",
        "time": "45 min",
        "price": 11.99,
        "additives": [
          {"title": "Chicken"},
          {"title": "Beef"},
          {"title": "Lamb"},
          {"title": "Pork"},
          {"title": "Barbeque Sauce"},
        ]
      },
      // Add more items if you'd like...
    ];


    return Scaffold(
      backgroundColor: kSecondary,
      appBar: AppBar(
        backgroundColor: kSecondary,
        title: ReusableText(text: "Food List", style: appStyle(18, kLightWhite, FontWeight.w600),),
      ),

      body: BackgroundContainer(
          child: Padding(
            padding: EdgeInsets.only(top: 18.h),
            child: ListView.builder(
              itemCount: foods.length,
              itemBuilder: (context, i) {
                final food = foods[i];
                 return FoodTile(food: food,);
              },
            ),
          )),
    );
  }
}


