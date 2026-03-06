import '../entities/floor_entity.dart';
import '../repositories/exhibit_repository.dart';

class GetAllFloorsUseCase {
  final ExhibitRepository _repository;

  GetAllFloorsUseCase(this._repository);

  List<FloorEntity> call() {
    return _repository.getAllFloors();
  }
}
