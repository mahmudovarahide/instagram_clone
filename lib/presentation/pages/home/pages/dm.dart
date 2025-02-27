import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram_app/core/constants/colors.dart';
import 'package:instagram_app/core/helpers/helpers.dart';
import 'package:instagram_app/presentation/global_widgets/custom_textfield.dart';

class DMscreen extends StatefulWidget {
  const DMscreen({super.key});

  @override
  State<DMscreen> createState() => _DMscreenState();
}

class _DMscreenState extends State<DMscreen> {
  late TextEditingController searchController;
  @override
  void initState() {
    super.initState();
    searchController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: greyAppBarColor,
        leading: const BackButton(),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.add,
              color: primaryBlackColor,
              size: 30,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
        ),
        child: Column(
          children: [
            CustomTextField(
              size: size,
              controller: searchController,
              prefixIcon: const Icon(Icons.search, color: Colors.grey),
              hint: 'Search',
              borderRadius: 20,
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      radius: 25,
                      backgroundImage: AssetImage(photosPath('oval.png')),
                    ),
                    title: const Text('joshua_1',
                        style: TextStyle(color: primaryBlackColor)),
                    subtitle: const Text('Last message...',
                        style: TextStyle(color: Colors.grey)),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          '10:30 AM',
                          style: TextStyle(color: Colors.grey),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Image.asset(
                            iconsPath('camera-icon.png'),
                          ),
                        ),
                      ],
                    ),
                    onTap: () {
                      // Navigate to chat screen
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
