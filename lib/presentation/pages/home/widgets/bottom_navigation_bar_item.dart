
import 'package:flutter/material.dart';
import 'package:instagram_app/core/constants/colors.dart';

class CustomBottomNavigationBarItem extends StatelessWidget {
  const CustomBottomNavigationBarItem({
    super.key,
    required this.icon,
    required this.index,
  });
  final Widget icon;
  final Color color = primaryBlackColor;
  final Color activeColor = primaryBlackColor;
  final int index;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: icon,
      onPressed: () => (){},
    );
  }
}
