// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class GlobalVariables {
  // Colors
  static const primaryColor = Color.fromARGB(255, 44, 46, 67);
  static const backgroundColor = Colors.white;

  static const List<String> brandCategoryImages = [
    'assets/Categories/apple.png',
    'assets/Categories/samsung.png',
    'assets/Categories/mi.png',
    'assets/Categories/vivo.png',
    'assets/Categories/oneplus.png',
    'assets/Categories/oppo.png',
    'assets/Categories/motorola.png',
    'assets/Categories/realme.png',
  ];

  static const List<ShopByCategoryItem> shopByCategoryList = [
    ShopByCategoryItem(name: 'Bestselling Mobiles', imageURL: 'assets/ShopBy/1.png'),
    ShopByCategoryItem(name: 'Verified Devices Only', imageURL: 'assets/ShopBy/2.png'),
    ShopByCategoryItem(name: 'Like New Condition', imageURL: 'assets/ShopBy/3.png'),
    ShopByCategoryItem(name: 'Phones with Warranty', imageURL: 'assets/ShopBy/4.png'),
    ShopByCategoryItem(name: 'Shop By Price', imageURL: 'assets/ShopBy/5.png'),
  ];

  static const List<FilterDataItem> filtersList = [
    FilterDataItem(
      name: 'Brand',
      filterList: [],
    ),
    FilterDataItem(
      name: 'Ram',
      filterList: [],
    ),
    FilterDataItem(
      name: 'Storage',
      filterList: [],
    ),
    FilterDataItem(
      name: 'Conditions',
      filterList: [],
    ),
    FilterDataItem(
      name: 'Warranty',
      filterList: [
        'Brand Warranty',
        'Seller Warranty'
      ],
    ),
    FilterDataItem(
      name: 'Verification',
      filterList: [
        'Verified'
      ],
    ),
  ];
}

class FilterDataItem {
  final String name;
  final List<String> filterList;

  const FilterDataItem({required this.name, required this.filterList});
}

class ShopByCategoryItem {
  final String name;
  final String imageURL;

  const ShopByCategoryItem({
    required this.name,
    required this.imageURL,
  });
}
