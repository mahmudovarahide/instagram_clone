import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:instagram_app/core/constants/colors.dart';
import 'package:instagram_app/core/helpers/helpers.dart';

class PostWidget extends StatefulWidget {
  const PostWidget({super.key});

  @override
  State<PostWidget> createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation colorAnimation;
  late Animation<double> sizeAnimation;

  int currentIndex = 0;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));

    colorAnimation = ColorTween(begin: Colors.grey.shade400, end: Colors.red)
        .animate(
            CurvedAnimation(parent: animationController, curve: Curves.easeIn));
    sizeAnimation = TweenSequence(<TweenSequenceItem<double>>[
      TweenSequenceItem(tween: Tween(begin: 1, end: 30), weight: 1),
      TweenSequenceItem(tween: Tween(begin: 30, end: 50), weight: 50),
      TweenSequenceItem(tween: Tween(begin: 50, end: 70), weight: 70),
      TweenSequenceItem(tween: Tween(begin: 70, end: 50), weight: 50),
      TweenSequenceItem(tween: Tween(begin: 50, end: 30), weight: 50),
    ]).animate(
        CurvedAnimation(parent: animationController, curve: Curves.easeIn));

    animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        animationController.reset();
      }
    });
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<String> images = [
      'https://www.w3schools.com/w3images/lights.jpg',
      'https://www.w3schools.com/w3images/lights.jpg',
      'https://www.w3schools.com/w3images/lights.jpg',
    ];

    return Column(
      children: [
        info(),
        const SizedBox(height: 10),
        GestureDetector(
          onDoubleTap: () {
            animationController.forward();
          },
          child: Stack(
            children: [
              CarouselSlider(
                items: images.map((image) {
                  return Image.network(
                    image,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  );
                }).toList(),
                options: CarouselOptions(
                  height: 300,
                  enlargeCenterPage: true,
                  viewportFraction: 1,
                  onPageChanged: (index, reason) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                ),
              ),
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                bottom: 0,
                child: AnimatedBuilder(
                  animation: animationController,
                  builder: (context, child) {
                    return Icon(
                      Icons.favorite,
                      color: colorAnimation.value,
                      size: sizeAnimation.value,
                    );
                  },
                ),
              )
            ],
          ),
        ),
        const SizedBox(height: 10),
        actions(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            images.length,
            (index) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  color: currentIndex == index ? Colors.blue : Colors.grey,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}

ListTile info() {
  return ListTile(
    leading: CircleAvatar(
      backgroundImage: AssetImage(photosPath('oval.png')),
    ),
    title: const Row(
      children: [
        Text(
          "Rahida",
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(
          width: 5,
        ),
        Icon(
          Icons.verified,
          color: primaryButtonColor,
        )
      ],
    ),
    subtitle: const Text(
      'Tokyo, Japan',
      style: TextStyle(color: Colors.black),
    ),
    trailing: IconButton(onPressed: () {}, icon: const Icon(Icons.more_horiz)),
  );
}

Row actions() {
  return Row(
    children: [
      const IconButton(
        onPressed: null,
        icon: Icon(
          Icons.favorite_border,
          size: 24,
          color: Colors.black54,
        ),
      ),
      IconButton(
        onPressed: null,
        icon: Image.asset(iconsPath('comment-icon.png')),
      ),
      IconButton(
        onPressed: null,
        icon: Image.asset(iconsPath('dm.png')),
      ),
      const Spacer(),
      const IconButton(
        onPressed: null,
        icon: Icon(Icons.bookmark_border, size: 24),
      ),
    ],
  );
}

