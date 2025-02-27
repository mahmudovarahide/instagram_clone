import 'package:flutter/material.dart';
import 'package:instagram_app/core/constants/colors.dart';
import 'package:instagram_app/core/helpers/helpers.dart';
import 'package:instagram_app/presentation/pages/home/widgets/bottom_navigation_bar_item.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({super.key});
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      elevation: 1,
      color: primaryInputColor,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const CustomBottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              index: 0,
            ),
            const CustomBottomNavigationBarItem(
              icon: Icon(Icons.search_outlined),
              index: 0,
            ),
            const CustomBottomNavigationBarItem(
              icon: Icon(
                Icons.add_a_photo_outlined,
              ),
              index: 0,
            ),
            const CustomBottomNavigationBarItem(
              icon: Icon(Icons.favorite_border),
              index: 0,
            ),
            IconButton(
              onPressed: () {},
              icon: Container(
                decoration: const BoxDecoration(shape: BoxShape.circle),
                child: Image.asset(
                  photosPath('story-1.png'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
