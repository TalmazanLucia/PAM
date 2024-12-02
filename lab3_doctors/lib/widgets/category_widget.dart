import 'package:flutter/material.dart';

class CategoryWidget extends StatelessWidget {
  final String title;
  final String iconPath;
  final Color backgroundColor;

  const CategoryWidget({
    required this.title,
    required this.iconPath,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    String truncatedTitle = title.length > 7 ? '${title.substring(0, 7)}...' : title;
    bool isNetworkImage = iconPath.startsWith('http') || iconPath.startsWith('https');

    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: isNetworkImage
              ? Image.network(
                  iconPath,
                  height: 30,
                  width: 30,
                  errorBuilder: (context, error, stackTrace) => (
                    const Icon(Icons.error, size: 30, color: Colors.red)
                  )
                )
              : Image.asset(
            iconPath,
            height: 30,
            width: 30,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          truncatedTitle,
          style: const TextStyle(fontSize: 12),
        ),
      ],
    );
  }
}
