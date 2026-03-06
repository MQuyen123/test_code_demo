import 'package:equatable/equatable.dart';
import '../../domain/entities/floor_entity.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final List<FloorEntity> floors;

  const HomeLoaded(this.floors);

  @override
  List<Object> get props => [floors];
}

class HomeError extends HomeState {
  final String message;

  const HomeError(this.message);

  @override
  List<Object> get props => [message];
}
