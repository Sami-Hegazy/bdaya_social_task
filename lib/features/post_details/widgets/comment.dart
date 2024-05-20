import 'package:flutter/material.dart';

class Comments extends StatelessWidget {
  const Comments({
    super.key,
    required this.comment,
  });

  final String comment;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CircleAvatar(
            backgroundImage: AssetImage('assets/images/friend_acc.png'),
            radius: 20,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Text(
                      'Bob\t',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Expanded(
                      child: Text(comment),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                const Row(
                  children: [
                    Text(
                      '2h', // Dummy time ago text
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                    SizedBox(width: 10),
                    Text(
                      'Like',
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                    SizedBox(width: 10),
                    Text(
                      'Reply',
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                  ],
                ),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(Icons.favorite_border, size: 16),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
