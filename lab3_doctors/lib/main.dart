import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'widgets/app_bar_widget.dart';
import 'widgets/search_bar_widget.dart';
import 'widgets/specialist_banner_widget.dart';
import 'widgets/categories_widget.dart';
import 'widgets/medical_centers_widget.dart';
import 'widgets/doctors_widget.dart';
import 'controller/data_controller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(fontFamily: 'Roboto'),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final DataController controller = Get.put(DataController());

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
                        return controller.bannersData.isNotEmpty
                            ? SpecialistBannerWidget(bannersData: controller.bannersData)
                            : const CircularProgressIndicator();
                      }),
                      const SizedBox(height: 20),
                      Obx(() {
                        return controller.categoriesData.isNotEmpty
                            ? CategoriesWidget(categoriesData: controller.categoriesData)
                            : const CircularProgressIndicator();
                      }),
                      const SizedBox(height: 20),
                      Obx(() {
                        return controller.nearbyCentersData.isNotEmpty
                            ? MedicalCentersWidget(centersData: controller.nearbyCentersData)
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
              return controller.doctorsData.isNotEmpty
                  ? DoctorsWidget(
                    doctorsData: controller.doctorsData,
                    onReverse: controller.reverseDoctors,
                  )
                  : const CircularProgressIndicator();
            }),
          ),
        ),
      ),
    );
  }
}
