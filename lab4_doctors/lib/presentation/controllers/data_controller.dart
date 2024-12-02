// presentation/controllers/data_controller.dart
import 'package:get/get.dart';
import '../../domain/entities/banner_entity.dart';
import '../../domain/entities/category_entity.dart';
import '../../domain/entities/medical_center_entity.dart';
import '../../domain/entities/doctor_entity.dart';
import '../../domain/usecases/get_banners_usecase.dart';
import '../../domain/usecases/get_categories_usecase.dart';
import '../../domain/usecases/get_medical_centers_usecase.dart';
import '../../domain/usecases/get_doctors_usecase.dart';

class DataController extends GetxController {
  final GetBanners getBanners;
  final GetCategories getCategories;
  final GetMedicalCenters getMedicalCenters;
  final GetDoctors getDoctors;

  DataController({
    required this.getBanners,
    required this.getCategories,
    required this.getMedicalCenters,
    required this.getDoctors,
  });

  var banners = <BannerEntity>[].obs;
  var categories = <CategoryEntity>[].obs;
  var nearbyCenters = <MedicalCenterEntity>[].obs;
  var doctors = <DoctorEntity>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadData();
  }

  Future<void> loadData() async {
    banners.value = await getBanners();
    categories.value = await getCategories();
    nearbyCenters.value = await getMedicalCenters();
    doctors.value = await getDoctors();
  }

  void reverseDoctorsList() {
    doctors.value = doctors.reversed.toList();
  }
}
