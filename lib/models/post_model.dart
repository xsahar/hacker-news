class Post {
  final int id;
  final String title;
  final String author;
  final int score;
  final int commentCount;
  final String url;
  final DateTime time;

  Post({
    required this.id,
    required this.title,
    required this.author,
    required this.score,
    required this.commentCount,
    required this.url,
    required this.time,
  });

  // Factory constructor: Converts JSON map into a Post object
  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'] ?? 0,
      title: json['title'] ?? 'No Title',
      author: json['by'] ?? 'Anonymous',
      score: json['score'] ?? 0,
      commentCount: json['descendants'] ?? 0,
      url: json['url'] ?? '',
      // Hacker News gives Unix timestamp (in seconds), so convert it to DateTime
      time: DateTime.fromMillisecondsSinceEpoch(
        (json['time'] ?? 0) * 1000,
      ),
    );
  }
}