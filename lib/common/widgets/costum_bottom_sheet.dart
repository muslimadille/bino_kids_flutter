import 'dart:ui';
import 'package:bino_kids/common/helpers/app_navigator.dart';
import 'package:flutter/material.dart';

class CustomBottomSheet{

  static CustomBottomSheet? _instance;

  CustomBottomSheet._internal();

  factory CustomBottomSheet() {
    return _instance ??= CustomBottomSheet._internal();
  }

  void displayModalBottomSheet({
    bool ?isDismiss,
    double? fixedSize,
    required Widget widget,
    Color? color,
    double? radius
  }) {
    showModalBottomSheet(
        context: AppNavigator().currentContext(),
        isDismissible: isDismiss??true,
        backgroundColor: Colors.transparent,
        isScrollControlled: true,
        enableDrag: true,
        builder: (BuildContext context) {
          return SizedBox(
            height: fixedSize,
            child: Scaffold(
              backgroundColor: Colors.transparent,
              body:Column(
                children: [
                  Expanded(
                    child: Container(
                        width: double.infinity,
                        decoration:BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: color,
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(radius??0),
                          ),
                        ),
                        child: widget
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}