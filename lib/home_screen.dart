
import 'package:flutter/material.dart';
import 'package:today_news_app/article_list_screen.dart';
import 'package:today_news_app/search_screen.dart';
import 'package:today_news_app/side_menu.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Dummy data for categories, as per Figma design with your provided images
    final List<Map<String, String>> categories = [
      {'name': 'Sports', 'image': 'assets/ball.png'},
      {'name': 'Politics', 'image': 'assets/Politics.png'},
      {'name': 'Health', 'image': 'assets/health.png'},
      {'name': 'Business', 'image': 'assets/bussines.png'},
      {'name': 'Environment', 'image': 'assets/environment.png'},
      {'name': 'Science', 'image': 'assets/science.png'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('News App'),
        backgroundColor: Colors.green,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SearchScreen()),
              );
            },
          ),
        ],
      ),
      drawer: const SideMenu(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 3 / 2,
          ),
          itemCount: categories.length,
          itemBuilder: (context, index) {
            final category = categories[index];
            return Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ArticleListScreen(categoryName: category['name']!),
                    ),
                  );
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      category['image']!,
                      height: 80,
                      width: 80,
                      errorBuilder: (context, error, stackTrace) {
                        // This will show a red box if an image fails to load
                        return Container(width: 80, height: 80, color: Colors.red);
                      },
                    ),
                    const SizedBox(height: 10),
                    Text(
                      category['name']!,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
