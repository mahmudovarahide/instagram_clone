import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:instagram_app/presentation/global_widgets/custom_textfield.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late FocusNode focusNode;
  late TextEditingController searchController;

  @override
  void initState() {
    super.initState();
    focusNode = FocusNode();
    searchController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    List<String> categories = [
      'shop', 'sport', 'music', 'tv', 'shop', 'sport', 'music', 'tv',
      'shop', 'sport', 'music', 'tv', 'shop', 'sport', 'music', 'tv'
    ];

    return Scaffold(
      appBar: AppBar(
        title: CustomTextField(
          focusNode: focusNode,
          onChanged: (value) {},
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                searchController.text = '';
              });
            },
            icon: Icon(Icons.highlight_remove_outlined),
          ),
          borderRadius: 10,
          prefixIcon: const Icon(Icons.search),
          size: size,
          controller: searchController,
          hint: 'Search',
        ),
      ),
      body: searchController.text.isNotEmpty
          ? searchUsers()  
          : explorePosts(categories), 
    );
  }

  Widget searchUsers() {
    return Center(
      child: Text(
        'Search Users UI here',
        style: TextStyle(fontSize: 18),
      ),
    );
  }

  Widget explorePosts(List<String> categories) {
    return RefreshIndicator(
      onRefresh: () async {},
      child: Column(
        children: [
          const SizedBox(height: 10),
          categoryList(categories),
          SizedBox(height: 10),
          postList(), 
        ],
      ),
    );
  }

  Widget categoryList(List<String> categories) {
    return SizedBox(
      height: 30,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 10),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                side: const BorderSide(width: 1, color: Colors.grey),
              ),
              onPressed: () {},
              child: Text(
                categories[index],
                style: const TextStyle(color: Colors.black),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget postList() {
    // Dummy UI for posts
    return Expanded(
      child: ListView.builder(
        itemBuilder: (context, index) {
          int size = index % 9 == 0 ? 2 : 1;
          return Padding(
            padding: const EdgeInsets.only(top: 3),
            child: StaggeredGrid.count(
              crossAxisCount: 3,
              mainAxisSpacing: 3,
              crossAxisSpacing: 3,
              children: [
                staggeredGridTile(index, 1),
                staggeredGridTile(index + 1, size),
                staggeredGridTile(index + 2, 1),
              ],
            ),
          );
        },
        itemCount: 5, // Set a number of items to display
      ),
    );
  }

  Widget staggeredGridTile(int index, int count) {
    return StaggeredGridTile.count(
      crossAxisCellCount: count,
      mainAxisCellCount: count,
      child: Container(
        color: Colors.grey,
        child: Center(
          child: Text('Post $index'),
        ),
      ),
    );
  }
}
