import '../entities/exhibit_entity.dart';
import '../entities/floor_entity.dart';

abstract class ExhibitRepository {
  List<FloorEntity> getAllFloors();
  ExhibitEntity? getByPin(String pin);
}
