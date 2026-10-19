import 'package:flutter/material.dart';
import 'views/feed/feed_view.dart';

void main() {
  runApp(const HackerNewsApp());

}
 
 class HackerNewsApp extends StatelessWidget {
  const HackerNewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hacker News',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 42, 155, 186)),
        useMaterial3: true ,
      ),
      home: const FeedView(),
    );
  }
}