import 'package:flutter/material.dart';
import 'package:instagram_app/core/constants/colors.dart';
import 'package:instagram_app/core/helpers/helpers.dart';
import 'package:instagram_app/presentation/pages/home/widgets/custom_bottom_navigation.dart';
import 'package:instagram_app/presentation/pages/home/widgets/post_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(
            color: primaryGreyColor,
            width: double.infinity,
            height: 1,
          ),
        ),
        leading: IconButton(
          onPressed: () {},
          icon: Image.asset(iconsPath('camera-icon.png')),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(photosPath('logo-dark-little.png'), width: 150),
          ],
        ),
        centerTitle: true, // Android'de de tam ortalamayı sağlar
        actions: [
          IconButton(
              onPressed: () {}, icon: Image.asset(iconsPath('igtv.png'))),
          IconButton(onPressed: () {}, icon: Image.asset(iconsPath('dm.png'))),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.only(top: 20),
        children: const [
          PostWidget(),
          PostWidget(),
        ],
      ),
      bottomNavigationBar: const CustomBottomNavBar(),
    );
  }
}
