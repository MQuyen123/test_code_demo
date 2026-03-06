import 'exhibit_model.dart';

class FloorModel {
  final int floorNumber;
  final Map<String, String> name;
  final String? mapImageAsset;
  final List<ExhibitModel> exhibits;

  const FloorModel({
    required this.floorNumber,
    required this.name,
    this.mapImageAsset,
    required this.exhibits,
  });

  String nameIn(String lang) => name[lang] ?? name['vi'] ?? '';
}
