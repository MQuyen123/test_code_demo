import 'package:equatable/equatable.dart';

class ExhibitEntity extends Equatable {
  final String id;
  final String pinCode;
  final String name;
  final String description;
  final int floor;
  final double markerX;
  final double markerY;
  final String category; // 'room', 'garden', etc.
  final bool isRoom;
  final String? audioUrl; // Đường dẫn file nhạc mp3
  final String? imagePath;

  const ExhibitEntity({
    required this.id,
    required this.pinCode,
    required this.name,
    required this.description,
    required this.floor,
    required this.markerX,
    required this.markerY,
    required this.category,
    this.isRoom = false,
    this.audioUrl,
    this.imagePath,
  });

  @override
  List<Object?> get props => [
        id,
        pinCode,
        name,
        description,
        floor,
        markerX,
        markerY,
        category,
        isRoom,
        audioUrl,
        imagePath,
      ];
}
