import 'package:flutter/material.dart';
import '../models/models.dart';
import 'medical_center_widget.dart';

class MedicalCentersWidget extends StatelessWidget {
  final List<MedicalCenterType> centersData;

  const MedicalCentersWidget({
    required this.centersData
  });

  @override
  Widget build(BuildContext context) {
    if (centersData.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
                'Nearby Medical Centers',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)
            ),
            Text('See All', style: TextStyle(color: Colors.blue)),
          ],
        ),
        const SizedBox(height: 16),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: centersData.map((center) {
              return MedicalCenterWidget(
                title: center.title,
                location: center.locationName,
                rating: center.reviewRate,
                distance: '${center.distanceKm} km',
                time: '${center.distanceMinutes} min',
                imagePath: center.image,
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
