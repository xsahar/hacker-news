import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/post_model.dart';

class HnApiService {

  static const String _baseUrl = 'https://hacker-news.firebaseio.com/v0';

  // Step 1: Fetch the list of top story IDs
  Future<List<int>> fetchTopStoryIds() async {
    final response = await http.get(Uri.parse('$_baseUrl/topstories.json'));

    if (response.statusCode == 200) {
      // Decode the raw JSON string into a List of numbers (IDs)
      List<dynamic> ids = jsonDecode(response.body);
      return ids.cast<int>();
    } else {
      throw Exception('Failed to load top story IDs');
    }
  }

  // Step 2: Fetch details for a single post using its ID
  Future<Post> fetchPostItem(int id) async {
    final response = await http.get(Uri.parse('$_baseUrl/item/$id.json'));

    if (response.statusCode == 200) {
      Map<String, dynamic> itemJson = jsonDecode(response.body);
      return Post.fromJson(itemJson);
    } else {
      throw Exception('Failed to load post $id');
    }
  }

  // Step 3: Fetch details for a specific list of post IDs (e.g., the top 20)
  Future<List<Post>> fetchTopPosts({int limit = 20}) async {
    final List<int> ids = await fetchTopStoryIds();
    
    // Take only the first 'limit' IDs to avoid downloading too many items at once
    final List<int> limitedIds = ids.take(limit).toList();

    // Fetch details for all selected posts concurrently
    final List<Future<Post>> postFutures = limitedIds.map((id) => fetchPostItem(id)).toList();
    
    // Wait for all requests to finish and return the list of Posts
    return await Future.wait(postFutures);
  }
}