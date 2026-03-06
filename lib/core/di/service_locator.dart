import '../../features/home/data/repositories/exhibit_repository_impl.dart';
import '../../features/home/domain/repositories/exhibit_repository.dart';
import '../../features/home/domain/usecases/get_all_floors_usecase.dart';

/// Service Locator trung tâm để inject dependencies (Repositories, UseCases).
class ServiceLocator {
  ServiceLocator._();

  static late final ExhibitRepository exhibitRepository;
  static late final GetAllFloorsUseCase getAllFloors;

  static void setup() {
    exhibitRepository = ExhibitRepositoryImpl();
    getAllFloors = GetAllFloorsUseCase(exhibitRepository);
  }
}
