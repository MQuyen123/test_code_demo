import '../../domain/entities/exhibit_entity.dart';
import '../../domain/entities/floor_entity.dart';

class LocalDataSource {
  static List<FloorEntity> getFloors() {
    return [_groundFloor, _firstFloor, _secondFloor];
  }

  static ExhibitEntity? getByPin(String pin) {
    // Không padLeft nữa để hỗ trợ mã R1, R2 hoặc 01, 02
    final all = [
      ..._groundFloor.exhibits,
      ..._firstFloor.exhibits,
      ..._secondFloor.exhibits,
    ];
    try {
      return all
          .firstWhere((e) => e.pinCode.toUpperCase() == pin.toUpperCase());
    } catch (_) {
      return null;
    }
  }

  // ─── TẦNG TRỆT (Ground Floor) ─────────────────────────────────
  static final FloorEntity _groundFloor = FloorEntity(
    floorNumber: 0,
    name: 'Tầng Trệt',
    exhibits: const [
      ExhibitEntity(
        id: 'gf_r1',
        pinCode: 'R1',
        name: 'Phòng Tiếp Khách Quốc Tế',
        description:
            'Phòng tiếp khách quốc tế là nơi Tổng thống Việt Nam Cộng hòa tiếp đón các nguyên thủ quốc gia, đại sứ và phái đoàn ngoại giao.',
        floor: 0,
        markerX: 0.25,
        markerY: 0.35,
        category: 'room',
        isRoom: true,
      ),
      ExhibitEntity(
        id: 'gf_r2',
        pinCode: 'R2',
        name: 'Phòng Trình Quốc Thư',
        description:
            'Nơi các đại sứ trình quốc thư lên Tổng thống với thiết kế trang nghiêm, thảm đỏ và những nghi lễ ngoại giao quan trọng.',
        floor: 0,
        markerX: 0.55,
        markerY: 0.35,
        category: 'room',
        isRoom: true,
      ),
      ExhibitEntity(
        id: 'gf_01',
        pinCode: '01',
        name: 'Chiếc xe tăng 390',
        description:
            'Đây là chiếc xe tăng Type 59 mang số hiệu 390, hiện vật gốc quý giá đã húc đổ cổng chính Dinh Độc Lập vào đúng 11 giờ 30 phút trưa ngày 30/4/1975. Khoảnh khắc chiếc xe tiến vào dinh không chỉ là biểu tượng của sức mạnh quân sự mà còn đánh dấu thời khắc thiêng liêng khi đất nước hoàn toàn thống nhất, non sông thu về một mối.',
        floor: 0,
        markerX: 0.50,
        markerY: 0.85,
        category: 'artifact',
        isRoom: false,
        audioUrl: 'chiec_xe_tang_390.mp3',
      ),
      ExhibitEntity(
        id: 'gf_02',
        pinCode: '02',
        name: 'Vườn Hoa Phía Trước',
        description:
            'Khuôn viên trước Dinh đối xứng hoàn hảo với thảm cỏ xanh mướt, đài phun nước trung tâm. Là không gian lý tưởng để chụp ảnh.',
        floor: 0,
        markerX: 0.30,
        markerY: 0.80,
        category: 'garden',
        isRoom: false,
      ),
    ],
  );

  // ─── TẦNG 1 (First Floor) ─────────────────────────────────────
  static final FloorEntity _firstFloor = FloorEntity(
    floorNumber: 1,
    name: 'Tầng 1',
    exhibits: const [
      ExhibitEntity(
        id: 'f1_r3',
        pinCode: 'R3',
        name: 'Phòng Nghị Sự Nội Các',
        description:
            'Phòng họp Nội các - trung tâm quyền lực của chính quyền Việt Nam Cộng hòa, với bàn họp lớn chứa hơn 20 bộ trưởng.',
        floor: 1,
        markerX: 0.30,
        markerY: 0.30,
        category: 'room',
        isRoom: true,
      ),
      ExhibitEntity(
        id: 'f1_r4',
        pinCode: 'R4',
        name: 'Phòng Làm Việc Tổng Thống',
        description:
            'Văn phòng của Tổng thống bố trí đơn giản nhưng uy nghi. Nổi bật là chiếc điện thoại đỏ đàm thoại trực tiếp với Mỹ.',
        floor: 1,
        markerX: 0.60,
        markerY: 0.30,
        category: 'room',
        isRoom: true,
      ),
      ExhibitEntity(
        id: 'f1_03',
        pinCode: '03',
        name: 'Điện thoại viễn thông',
        description:
            'Hệ thống liên lạc viễn thông đặc biệt dùng trong thời chiến được bảo quản nguyên vẹn cạnh phòng làm việc.',
        floor: 1,
        markerX: 0.65,
        markerY: 0.25,
        category: 'artifact',
        isRoom: false,
      ),
    ],
  );

  // ─── TẦNG 2 (Second Floor) ────────────────────────────────────
  static final FloorEntity _secondFloor = FloorEntity(
    floorNumber: 2,
    name: 'Tầng 2',
    exhibits: const [
      ExhibitEntity(
        id: 'f2_r5',
        pinCode: 'R5',
        name: 'Phòng Chiếu Phim',
        description:
            'Rạp chiếu phim riêng với khoảng 50 ghế ngồi bọc nhung và thiết bị tân tiến phục vụ nhu cầu giải trí.',
        floor: 2,
        markerX: 0.25,
        markerY: 0.35,
        category: 'room',
        isRoom: true,
      ),
      ExhibitEntity(
        id: 'f2_r6',
        pinCode: 'R6',
        name: 'Phòng Ăn Gia Đình',
        description:
            'Phòng ăn riêng tư với bộ sưu tập gốm sứ tinh xảo, nhìn thẳng ra khuôn viên ngập ánh nắng.',
        floor: 2,
        markerX: 0.55,
        markerY: 0.30,
        category: 'room',
        isRoom: true,
      ),
      ExhibitEntity(
        id: 'f2_04',
        pinCode: '04',
        name: 'Máy chiếu phim cổ',
        description:
            'Chiếc máy chiếu phim chạy bằng cuộn phim nhựa 35mm được bảo dưỡng và trưng bày như chứng tích của thời đại.',
        floor: 2,
        markerX: 0.30,
        markerY: 0.38,
        category: 'artifact',
        isRoom: false,
      ),
    ],
  );
}
