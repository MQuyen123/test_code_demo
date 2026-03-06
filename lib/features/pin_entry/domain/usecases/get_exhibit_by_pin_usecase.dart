import '../../../../features/home/domain/entities/exhibit_entity.dart';
import '../../../../features/home/domain/repositories/exhibit_repository.dart';

class GetExhibitByPinUseCase {
  final ExhibitRepository _repository;

  GetExhibitByPinUseCase(this._repository);

  ExhibitEntity? call(String pin) {
    return _repository.getByPin(pin);
  }
}
