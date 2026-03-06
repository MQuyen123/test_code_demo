import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/get_all_floors_usecase.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final GetAllFloorsUseCase _getAllFloors;

  HomeCubit(this._getAllFloors) : super(HomeInitial());

  void loadFloors() {
    emit(HomeLoading());
    try {
      final floors = _getAllFloors();
      emit(HomeLoaded(floors));
    } catch (e) {
      emit(HomeError(e.toString()));
    }
  }
}
