
import 'package:flutter/material.dart';

class ArticleScreen extends StatelessWidget {
  final Map<String, dynamic> article;

  const ArticleScreen({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white), // White back icon
      ),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Article Image
            article['urlToImage'] != null
                ? Image.network(
                    article['urlToImage'],
                    fit: BoxFit.cover,
                    height: 250,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        height: 250,
                        color: Colors.grey[300],
                        child: const Center(child: Icon(Icons.image_not_supported, size: 50)),
                      );
                    },
                  )
                : Container(
                    height: 250,
                    color: Colors.grey[300],
                    child: const Center(child: Icon(Icons.image_not_supported, size: 50)),
                  ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                article['title'] ?? 'No Title',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            // Article Author and Source
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
              child: Text(
                'By ${article['author'] ?? 'Unknown'} | ${article['source']['name'] ?? 'Unknown Source'}',
                style: const TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ),
            // Article Description/Content
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Text(
                article['description'] ?? article['content'] ?? 'No content available.',
                style: const TextStyle(fontSize: 16, height: 1.5),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
