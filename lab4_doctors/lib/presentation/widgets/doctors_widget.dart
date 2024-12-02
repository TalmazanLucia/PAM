import 'package:flutter/material.dart';
import '../../domain/entities/doctor_entity.dart';
import 'doctor_widget.dart';

class DoctorsWidget extends StatefulWidget {
  final List<DoctorEntity> doctorsData;

  const DoctorsWidget({
    required this.doctorsData,
  });

  @override
    _DoctorsWidgetState createState() => _DoctorsWidgetState();
  }

class _DoctorsWidgetState extends State<DoctorsWidget> {
  Map<String, bool> favoriteStatus = {};

  @override
  void initState() {
    super.initState();
    initializeFavoriteStatus();
  }

  void initializeFavoriteStatus() {
    for (var doctor in widget.doctorsData) {
      favoriteStatus[doctor.fullName] = favoriteStatus[doctor.fullName] ?? false;
    }
  }

  void toggleFavorite(String fullName) {
    setState(() {
      favoriteStatus[fullName] = !(favoriteStatus[fullName] ?? false);
    });
  }

  @override
  Widget build(BuildContext context) {
    if (widget.doctorsData.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '${widget.doctorsData.length} found',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const Text(
              'Default',
              style: TextStyle(
                color: Colors.blue,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Expanded(
          child: ListView.builder(
            itemCount: widget.doctorsData.length,
            itemBuilder: (context, index) {
              final doctor = widget.doctorsData[index];
              return DoctorWidget(
                key: ValueKey(doctor.fullName),
                name: doctor.fullName,
                specialty: doctor.typeOfDoctor,
                location: doctor.locationOfCenter,
                rating: doctor.reviewRate,
                reviews: doctor.reviewsCount,
                imagePath: doctor.image,
                isFavorite: favoriteStatus[doctor.fullName] ?? false,
                onFavoriteToggle: () => toggleFavorite(doctor.fullName),
              );
            },
          ),
        ),
      ],
    );
  }
}
