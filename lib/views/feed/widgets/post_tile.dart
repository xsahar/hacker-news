import 'package:flutter/material.dart';
import '../../../models/post_model.dart';

class PostTile extends StatelessWidget {
  final Post post;
  final VoidCallback onTap;
  final VoidCallback onUpvote;

  const PostTile({
    Key? key,
    required this.post,
    required this.onTap,
    required this.onUpvote,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: ListTile(
        title: Text(
          post.title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text(
            'By ${post.author} • ${post.score} points • ${post.commentCount} comments',
            style: TextStyle(color: Colors.grey[600], fontSize: 13),
          ),
        ),
        trailing: IconButton(
          icon: const Icon(Icons.arrow_upward, color: Colors.orange),
          onPressed: onUpvote,
          tooltip: 'Upvote',
        ),
        onTap: onTap,
      ),
    );
  }
}