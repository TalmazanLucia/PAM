import 'package:flutter/material.dart';

class MedicalCenterWidget extends StatelessWidget {
  final String title;
  final String location;
  final double rating;
  final String distance;
  final String time;
  final String imagePath;

  const MedicalCenterWidget({
    required this.title,
    required this.location,
    required this.rating,
    required this.distance,
    required this.time,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      margin: const EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 8,
            spreadRadius: 2,
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 120,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
              image: DecorationImage(
                image: NetworkImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
                const SizedBox(height: 4),
                Text(location, style: const TextStyle(fontSize: 12)),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(Icons.star, size: 16, color: Colors.yellow),
                    const SizedBox(width: 4),
                    Text('$rating'),
                    const Spacer(),
                    Text('$distance/$time'),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
