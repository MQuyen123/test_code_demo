import 'package:equatable/equatable.dart';
import 'exhibit_entity.dart';

class FloorEntity extends Equatable {
  final int floorNumber;
  final String name;
  final String mapImagePath;
  final List<ExhibitEntity> exhibits;

  const FloorEntity({
    required this.floorNumber,
    required this.name,
    required this.mapImagePath,
    required this.exhibits,
  });

  @override
  List<Object?> get props => [floorNumber, name, mapImagePath, exhibits];
}
