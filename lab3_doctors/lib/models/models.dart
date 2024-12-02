class BannerType {
  final String title;
  final String description;
  final String image;

  BannerType({
    required this.title,
    required this.description,
    required this.image
  });

  factory BannerType.fromJson(Map<String, dynamic> json) {
    return BannerType(
      title: json['title'],
      description: json['description'],
      image: json['image'],
    );
  }
}

class CategoryType {
  final String title;
  final String icon;

  CategoryType({
    required this.title,
    required this.icon
  });

  factory CategoryType.fromJson(Map<String, dynamic> json) {
    return CategoryType(
      title: json['title'],
      icon: json['icon'],
    );
  }
}

class MedicalCenterType {
  final String image;
  final String title;
  final String locationName;
  final double reviewRate;
  final int countReviews;
  final double distanceKm;
  final int distanceMinutes;

  MedicalCenterType({
    required this.image,
    required this.title,
    required this.locationName,
    required this.reviewRate,
    required this.countReviews,
    required this.distanceKm,
    required this.distanceMinutes,
  });

  factory MedicalCenterType.fromJson(Map<String, dynamic> json) {
    return MedicalCenterType(
      image: json['image'],
      title: json['title'],
      locationName: json['location_name'],
      reviewRate: json['review_rate'],
      countReviews: json['count_reviews'],
      distanceKm: json['distance_km'],
      distanceMinutes: json['distance_minutes'],
    );
  }
}

class DoctorType {
  final String image;
  final String fullName;
  final String typeOfDoctor;
  final String locationOfCenter;
  final double reviewRate;
  final int reviewsCount;

  DoctorType({
    required this.image,
    required this.fullName,
    required this.typeOfDoctor,
    required this.locationOfCenter,
    required this.reviewRate,
    required this.reviewsCount,
  });

  factory DoctorType.fromJson(Map<String, dynamic> json) {
    return DoctorType(
      image: json['image'],
      fullName: json['full_name'],
      typeOfDoctor: json['type_of_doctor'],
      locationOfCenter: json['location_of_center'],
      reviewRate: json['review_rate'],
      reviewsCount: json['reviews_count'],
    );
  }
}
