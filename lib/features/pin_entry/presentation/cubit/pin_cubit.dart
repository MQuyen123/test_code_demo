import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/get_exhibit_by_pin_usecase.dart';
import 'pin_state.dart';

class PinCubit extends Cubit<PinState> {
  final GetExhibitByPinUseCase _getByPin;

  PinCubit(this._getByPin) : super(PinInitial());

  void lookupPin(String pin) {
    if (pin.isEmpty) {
      emit(const PinError('Vui lòng nhập mã số (01-10)'));
      return;
    }

    emit(PinLoading());
    final exhibit = _getByPin(pin);

    if (exhibit != null) {
      emit(PinSuccess(exhibit));
      emit(PinInitial()); // Reset for next inputs
    } else {
      emit(const PinError('Không tìm thấy hiện vật/phòng với mã này'));
    }
  }
}
