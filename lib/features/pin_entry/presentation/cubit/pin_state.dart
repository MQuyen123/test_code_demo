import 'package:equatable/equatable.dart';
import '../../../../features/home/domain/entities/exhibit_entity.dart';

abstract class PinState extends Equatable {
  const PinState();

  @override
  List<Object> get props => [];
}

class PinInitial extends PinState {}

class PinLoading extends PinState {}

class PinSuccess extends PinState {
  final ExhibitEntity exhibit;

  const PinSuccess(this.exhibit);

  @override
  List<Object> get props => [exhibit];
}

class PinError extends PinState {
  final String message;

  const PinError(this.message);

  @override
  List<Object> get props => [message];
}
