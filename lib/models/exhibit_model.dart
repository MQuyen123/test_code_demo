class ExhibitModel {
  final String id;
  final String pinCode;
  final Map<String, String> name;
  final Map<String, String> description;
  final int floor;
  final String? imageAsset;
  final String? audioAsset;
  final double markerX; // relative position on map (0.0–1.0)
  final double markerY;
  final String category; // 'room', 'artifact', 'garden'

  const ExhibitModel({
    required this.id,
    required this.pinCode,
    required this.name,
    required this.description,
    required this.floor,
    this.imageAsset,
    this.audioAsset,
    required this.markerX,
    required this.markerY,
    this.category = 'room',
  });
}
