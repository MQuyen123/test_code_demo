import '../../domain/entities/exhibit_entity.dart';
import '../../domain/entities/floor_entity.dart';

class LocalDataSource {
  static List<FloorEntity> getFloors() {
    return [_groundFloor, _firstFloor, _secondFloor];
  }

  static ExhibitEntity? getByPin(String pin) {
    final all = [
      ..._groundFloor.exhibits,
      ..._firstFloor.exhibits,
      ..._secondFloor.exhibits,
    ];
    try {
      return all.firstWhere((e) => e.pinCode == pin.padLeft(2, '0'));
    } catch (_) {
      return null;
    }
  }

  // ─── TẦNG TRỆT (Ground Floor) — 4 phòng ─────────────────────────────────
  static final FloorEntity _groundFloor = FloorEntity(
    floorNumber: 0,
    name: 'Tầng Trệt',
    exhibits: const [
      ExhibitEntity(
        id: 'gf_01',
        pinCode: '01',
        name: 'Phòng Tiếp Khách Quốc Tế',
        description:
            'Phòng tiếp khách quốc tế là nơi Tổng thống Việt Nam Cộng hòa tiếp đón các nguyên thủ quốc gia, đại sứ và phái đoàn ngoại giao nước ngoài. Phòng được trang trí theo phong cách cổ điển châu Âu kết hợp với các họa tiết truyền thống Việt Nam, với bộ ghế ngồi bọc nhung đỏ sang trọng và những bức tranh sơn mài đặc sắc.',
        floor: 0,
        markerX: 0.25,
        markerY: 0.35,
        category: 'room',
      ),
      ExhibitEntity(
        id: 'gf_02',
        pinCode: '02',
        name: 'Phòng Trình Quốc Thư',
        description:
            'Đây là nơi các đại sứ các nước đến trình quốc thư lên Tổng thống. Phòng có thiết kế trang nghiêm với thảm đỏ trải dài, cờ Việt Nam Cộng hòa và ghế ngai bằng gỗ mun chạm khắc tinh xảo. Những nghi lễ ngoại giao quan trọng nhất đều được tổ chức tại đây.',
        floor: 0,
        markerX: 0.55,
        markerY: 0.35,
        category: 'room',
      ),
      ExhibitEntity(
        id: 'gf_03',
        pinCode: '03',
        name: 'Phòng Khiêu Vũ',
        description:
            'Phòng khiêu vũ rộng lớn từng là nơi tổ chức các buổi dạ tiệc và vũ hội ngoại giao. Với diện tích hàng trăm mét vuông, sàn gỗ đánh bóng và đèn chùm pha lê lộng lẫy, phòng tạo nên không gian lễ hội xa hoa. Hiện nay, nơi đây thỉnh thoảng vẫn được sử dụng cho các sự kiện văn hóa đặc biệt.',
        floor: 0,
        markerX: 0.75,
        markerY: 0.60,
        category: 'room',
      ),
      ExhibitEntity(
        id: 'gf_04',
        pinCode: '04',
        name: 'Vườn Hoa Phía Trước',
        description:
            'Khuôn viên trước Dinh được thiết kế đối xứng hoàn hảo với thảm cỏ xanh mướt, hàng cây thẳng tắp và đài phun nước trung tâm. Đây là không gian để chụp ảnh và thư giãn. Từ đây, du khách có thể chiêm ngưỡng vẻ đẹp toàn cảnh của công trình kiến trúc lịch sử này.',
        floor: 0,
        markerX: 0.50,
        markerY: 0.80,
        category: 'garden',
      ),
    ],
  );

  // ─── TẦNG 1 (First Floor) — 3 phòng ─────────────────────────────────────
  static final FloorEntity _firstFloor = FloorEntity(
    floorNumber: 1,
    name: 'Tầng 1',
    exhibits: const [
      ExhibitEntity(
        id: 'f1_05',
        pinCode: '05',
        name: 'Phòng Nghị Sự Nội Các',
        description:
            'Phòng họp Nội các là trung tâm quyền lực của chính quyền Việt Nam Cộng hòa. Bàn họp hình chữ nhật bằng gỗ quý có thể chứa hơn 20 bộ trưởng. Tại đây, những quyết sách quan trọng nhất về chiến tranh, kinh tế và ngoại giao đã được thảo luận và thông qua trong suốt hai thập kỷ.',
        floor: 1,
        markerX: 0.30,
        markerY: 0.30,
        category: 'room',
      ),
      ExhibitEntity(
        id: 'f1_06',
        pinCode: '06',
        name: 'Phòng Làm Việc Tổng Thống',
        description:
            'Văn phòng làm việc của Tổng thống được bố trí đơn giản nhưng uy nghi. Bàn làm việc bằng gỗ gụ đặt trước cửa sổ nhìn ra vườn hoa. Trên tường là bản đồ Việt Nam và chân dung các danh nhân. Chiếc điện thoại màu đỏ kết nối thẳng đến Nhà Trắng là hiện vật đặc biệt thu hút khách tham quan.',
        floor: 1,
        markerX: 0.60,
        markerY: 0.30,
        category: 'room',
      ),
      ExhibitEntity(
        id: 'f1_07',
        pinCode: '07',
        name: 'Phòng Trình Bày Lịch Sử',
        description:
            'Phòng trưng bày tập hợp các tài liệu, hình ảnh và hiện vật ghi lại lịch sử xây dựng và sử dụng của Dinh Độc Lập. Bộ sưu tập bao gồm bản vẽ thiết kế gốc của kiến trúc sư Ngô Viết Thụ, ảnh lễ khánh thành năm 1966, và các kỷ vật ngoại giao quý hiếm từ thời kỳ Chiến tranh Việt Nam.',
        floor: 1,
        markerX: 0.50,
        markerY: 0.65,
        category: 'room',
      ),
    ],
  );

  // ─── TẦNG 2 (Second Floor) — 3 phòng ────────────────────────────────────
  static final FloorEntity _secondFloor = FloorEntity(
    floorNumber: 2,
    name: 'Tầng 2',
    exhibits: const [
      ExhibitEntity(
        id: 'f2_08',
        pinCode: '08',
        name: 'Phòng Chiếu Phim',
        description:
            'Rạp chiếu phim riêng của Dinh với sức chứa khoảng 50 ghế bọc nhung sang trọng. Phòng được trang bị hệ thống chiếu phim hiện đại nhất thời bấy giờ, phục vụ nhu cầu giải trí của Tổng thống, gia đình và khách quý. Màn ảnh rộng và hệ thống âm thanh vòm vẫn được bảo tồn nguyên vẹn.',
        floor: 2,
        markerX: 0.25,
        markerY: 0.35,
        category: 'room',
      ),
      ExhibitEntity(
        id: 'f2_09',
        pinCode: '09',
        name: 'Phòng Ăn Gia Đình',
        description:
            'Phòng ăn riêng tư của gia đình Tổng thống với bàn ăn gỗ 12 chỗ ngồi. Đặc trưng nổi bật là bộ sưu tập bình hoa gốm sứ Biên Hòa và tranh thêu thủ công truyền thống Việt Nam. Từ cửa sổ phòng ăn, có thể nhìn thấy toàn cảnh vườn Dinh tràn ngập ánh nắng.',
        floor: 2,
        markerX: 0.55,
        markerY: 0.30,
        category: 'room',
      ),
      ExhibitEntity(
        id: 'f2_10',
        pinCode: '10',
        name: 'Phòng Giải Trí & Trò Chơi',
        description:
            'Phòng giải trí với bàn bi-a, bàn bóng bàn và góc chơi bài bribge dành cho Tổng thống và các thành viên hoàng gia. Tủ sách góc tây chứa hàng nghìn đầu sách bằng nhiều ngôn ngữ. Đây cũng là nơi Tổng thống Ngô Đình Diệm thường thổi sáo và thư giãn sau những ngày làm việc căng thẳng.',
        floor: 2,
        markerX: 0.75,
        markerY: 0.55,
        category: 'room',
      ),
    ],
  );
}
