import 'dart:math';
import 'package:flutter/material.dart';
import 'category_widget.dart';
import '../models/models.dart';

class CategoriesWidget extends StatelessWidget {
  final List<CategoryType> categoriesData;

  const CategoriesWidget({
    required this.categoriesData
  });

  @override
  Widget build(BuildContext context) {
    if (categoriesData.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }

    int mid = (categoriesData.length / 2).ceil();
    var firstRow = categoriesData.sublist(0, mid);
    var secondRow = categoriesData.sublist(mid);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
                'Categories',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)
            ),
            Text('See All', style: TextStyle(color: Colors.blue)),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: firstRow.map((category) {
            return CategoryWidget(
              title: category.title,
              iconPath: category.icon,
              backgroundColor: _getRandomColor(),
            );
          }).toList(),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: secondRow.map((category) => CategoryWidget(
            title: category.title,
            iconPath: category.icon,
            backgroundColor: _getRandomColor(),
            )
          ).toList(),
        ),
      ],
    );
  }

  Color _getRandomColor() {
    final Random random = Random();
    return Color.fromARGB(
      255,
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
    );
  }
}
