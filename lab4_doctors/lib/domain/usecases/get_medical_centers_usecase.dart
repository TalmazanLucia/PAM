import '../entities/medical_center_entity.dart';
import '../repositories/medical_center_repository.dart';

class GetMedicalCenters {
  final MedicalCenterRepository repository;

  GetMedicalCenters(this.repository);

  Future<List<MedicalCenterEntity>> call() async {
    return await repository.fetchNearbyMedicalCenters();
  }
}