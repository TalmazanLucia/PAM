// presentation/screens/home_screen.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/data_controller.dart';
import '../widgets/app_bar_widget.dart';
import '../widgets/search_bar_widget.dart';
import '../widgets/specialist_banner_widget.dart';
import '../widgets/categories_widget.dart';
import '../widgets/medical_centers_widget.dart';
import '../widgets/doctors_widget.dart';

class HomeScreen extends StatelessWidget {
  final DataController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: buildAppBarWidget(),
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      SearchBarWidget(),
                      const SizedBox(height: 20),
                      Obx(() {
                        return controller.banners.isNotEmpty
                            ? SpecialistBannerWidget(bannersData: controller.banners)
                            : const CircularProgressIndicator();
                      }),
                      const SizedBox(height: 20),
                      Obx(() {
                        return controller.categories.isNotEmpty
                            ? CategoriesWidget(categoriesData: controller.categories)
                            : const CircularProgressIndicator();
                      }),
                      const SizedBox(height: 20),
                      Obx(() {
                        return controller.nearbyCenters.isNotEmpty
                            ? MedicalCentersWidget(centersData: controller.nearbyCenters)
                            : const CircularProgressIndicator();
                      }),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ];
          },
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Obx(() {
              return controller.doctors.isNotEmpty
                  ? DoctorsWidget(
                    doctorsData: controller.doctors,
                  )
                  : const CircularProgressIndicator();
            }),
          ),
        ),
      ),
    );
  }
}
