import '../../domain/entities/exhibit_entity.dart';
import '../../domain/entities/floor_entity.dart';
import '../../domain/repositories/exhibit_repository.dart';
import '../sources/local_data_source.dart';

class ExhibitRepositoryImpl implements ExhibitRepository {
  @override
  List<FloorEntity> getAllFloors() {
    return LocalDataSource.getFloors();
  }

  @override
  ExhibitEntity? getByPin(String pin) {
    return LocalDataSource.getByPin(pin);
  }
}
