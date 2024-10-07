import 'package:expense_tacker_app/view_model/utils/app_colors.dart';
import 'package:flutter/material.dart';

ThemeData ligtTheme = ThemeData.light().copyWith(
    scaffoldBackgroundColor: AppColor.lightOrange,
    appBarTheme: const AppBarTheme(
      color: AppColor.lightOrange,
      iconTheme: IconThemeData(
        color: AppColor.grey,
      ),
    ),
    textTheme: const TextTheme(
      bodyMedium: TextStyle(
        color: AppColor.orange,
        fontSize: 16,
      ),
      bodyLarge: TextStyle(
          color: AppColor.grey, fontSize: 18, fontWeight: FontWeight.bold),
      bodySmall: TextStyle(
        color: AppColor.grey,
        fontSize: 15,
      ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColor.orange,
    ),
    buttonTheme: const ButtonThemeData(buttonColor: AppColor.orange),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(backgroundColor: AppColor.orange)));
