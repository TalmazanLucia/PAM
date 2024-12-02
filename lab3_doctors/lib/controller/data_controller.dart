import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../models/models.dart';

class DataController extends GetxController {
  var bannersData = <BannerType>[].obs;
  var categoriesData = <CategoryType>[].obs;
  var nearbyCentersData = <MedicalCenterType>[].obs;
  var doctorsData = <DoctorType>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadData();
  }

  Future<void> loadData() async {
    final String response = await rootBundle.loadString('lib/data/v1.json');
    final data = json.decode(response);

    bannersData.value = (data['banners'] as List).map((e) => BannerType.fromJson(e)).toList();
    categoriesData.value = (data['categories'] as List).map((e) => CategoryType.fromJson(e)).toList();
    nearbyCentersData.value = (data['nearby_centers'] as List).map((e) => MedicalCenterType.fromJson(e)).toList();
    doctorsData.value = (data['doctors'] as List).map((e) => DoctorType.fromJson(e)).toList();
  }

  void reverseDoctors() {
    doctorsData.value = doctorsData.reversed.toList();
  }
}
