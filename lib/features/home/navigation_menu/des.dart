import 'package:flutter/material.dart';

class Destination {
  const Destination(this.title, this.icon, this.color);
  final String title;
  final IconData icon;
  final MaterialColor color;
}

const List<Destination> allDestinations = <Destination>[
  Destination('Home', Icons.home, Colors.teal),
  Destination('Search', Icons.search, Colors.cyan),
  Destination('Moments', Icons.add_box_outlined, Colors.orange),
  Destination('Reels', Icons.slow_motion_video_sharp, Colors.blue),
  Destination('Profile', Icons.person_pin, Colors.purple),
];
