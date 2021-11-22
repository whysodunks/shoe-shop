import 'package:app_shoe_shop/core/const.dart';
import 'package:flutter/material.dart';

class ShoeModel {
  final String name;
  final double price;
  final String desc;
  final Color color;
  final String brand;
  final String imgPath;

  ShoeModel({
    this.name,
    this.price,
    this.desc,
    this.color,
    this.brand,
    this.imgPath,
  });

  static List<ShoeModel> list = [
    ShoeModel(
      name: "Nike 76 Kamikaze DDR 2 ",
      desc: "The vscode folder contains launch configuration and tasks you configure in VS Code which you may wish to be included in version control, so this line is commented out by default.",
      price: 188,
      color: AppColors.blueColor,
      brand: "Nike",
      imgPath: "shoes2.png",
    ),
    ShoeModel(
      name: "Nike Air 91 Water",
      desc: "No problem have been detected in the workspace so far",
      price: 122,
      color: AppColors.yellowColor,
      brand: "Rokie",
      imgPath: "shoes1.png",
    ),
    ShoeModel(
      name: "Nike Air Jordan High School",
      desc: "No problem have been detected in the workspace so far",
      price: 261,
      color: AppColors.orangeColor,
      brand: "Nike",
      imgPath: "shoes.png",
    ),
  ];
}
