import '../entities/doctor_entity.dart';

abstract class DoctorRepository {
  Future<List<DoctorEntity>> fetchDoctors();
}