import '../../domain/entities/exhibit_entity.dart';
import '../../domain/entities/floor_entity.dart';

class LocalDataSource {
  static List<FloorEntity> getFloors() {
    return [
      _basement,
      _groundFloor,
      _floor1,
      _floor2,
      _floor3,
      _floor4,
    ];
  }

  static ExhibitEntity? getByPin(String pin) {
    final all = [
      ..._floor4.exhibits,
      ..._floor3.exhibits,
      ..._floor2.exhibits,
      ..._floor1.exhibits,
      ..._groundFloor.exhibits,
      ..._basement.exhibits,
    ];
    try {
      return all
          .firstWhere((e) => e.pinCode.toUpperCase() == pin.toUpperCase());
    } catch (_) {
      return null;
    }
  }

  // ─── TẦNG 4 / 4TH FLOOR ─────────────────────────────────────
  static final FloorEntity _floor4 = FloorEntity(
    floorNumber: 4,
    name: 'Tầng 4',
    mapImagePath: 'assets/images/map/4th.png',
    exhibits: const [
      ExhibitEntity(
        id: 'f4_17',
        pinCode: '17',
        name: 'Tứ phương vô sự lầu',
        description:
            'Phòng thư giãn có vị trí cao nhất của dinh, tầm nhìn bao quát tứ hướng.',
        floor: 4,
        markerX: 0.50,
        markerY: 0.50,
        category: 'room',
        isRoom: true,
        audioUrl: 'chiec_xe_tang_390.mp3',
        imagePath: 'phong_hoi_truong.webp',
      ),
      ExhibitEntity(
        id: 'f4_18',
        pinCode: '18',
        name: 'Trực thăng UH1',
        description:
            'Chiếc trực thăng UH-1 nằm trên nóc dinh, từng được dùng để di tản trong những ngày cuối tháng 4/1975.',
        floor: 4,
        markerX: 0.70,
        markerY: 0.30,
        category: 'artifact',
        isRoom: false,
        audioUrl: 'chiec_xe_tang_390.mp3',
        imagePath: 'phong_hoi_truong.webp',
      ),
    ],
  );

  // ─── TẦNG 3 / 3RD FLOOR ─────────────────────────────────────
  static final FloorEntity _floor3 = FloorEntity(
    floorNumber: 3,
    name: 'Tầng 3',
    mapImagePath: 'assets/images/map/3rd.png',
    exhibits: const [
      ExhibitEntity(
        id: 'f3_13',
        pinCode: '13',
        name: 'Thư viện',
        description:
            'Nơi lưu trữ sách báo và các tài liệu của gia đình Tổng thống.',
        floor: 3,
        markerX: 0.20,
        markerY: 0.85,
        category: 'room',
        isRoom: true,
        audioUrl: 'chiec_xe_tang_390.mp3',
        imagePath: 'phong_hoi_truong.webp',
      ),
      ExhibitEntity(
        id: 'f3_14',
        pinCode: '14',
        name: 'Phòng tiếp khách của phu nhân Tổng thống',
        description:
            'Phòng khách được trang trí tinh tế, sang trọng theo gu thẩm mỹ của phu nhân đệ nhất.',
        floor: 3,
        markerX: 0.40,
        markerY: 0.60,
        category: 'room',
        isRoom: true,
        audioUrl: 'chiec_xe_tang_390.mp3',
        imagePath: 'phong_hoi_truong.webp',
      ),
      ExhibitEntity(
        id: 'f3_15',
        pinCode: '15',
        name: 'Phòng chiếu phim',
        description:
            'Rạp chiếu phim thu nhỏ dành riêng cho Tổng thống và gia đình giải trí.',
        floor: 3,
        markerX: 0.60,
        markerY: 0.50,
        category: 'room',
        isRoom: true,
        audioUrl: 'chiec_xe_tang_390.mp3',
        imagePath: 'phong_hoi_truong.webp',
      ),
      ExhibitEntity(
        id: 'f3_16',
        pinCode: '16',
        name: 'Phòng giải trí',
        description:
            'Nơi chơi bài, bi da và thư giãn của các tướng lĩnh và quan chức cấp cao.',
        floor: 3,
        markerX: 0.65,
        markerY: 0.30,
        category: 'room',
        isRoom: true,
        audioUrl: 'chiec_xe_tang_390.mp3',
        imagePath: 'phong_hoi_truong.webp',
      ),
    ],
  );

  // ─── TẦNG 2 / 2ND FLOOR ─────────────────────────────────────
  static final FloorEntity _floor2 = FloorEntity(
    floorNumber: 2,
    name: 'Tầng 2',
    mapImagePath: 'assets/images/map/2nd.png',
    exhibits: const [
      ExhibitEntity(
        id: 'f2_05',
        pinCode: '05',
        name: 'Phòng Hội đồng an ninh Quốc gia',
        description:
            'Nơi đưa ra những quyết sách mang tính sống còn của Việt Nam Cộng Hòa.',
        floor: 2,
        markerX: 0.20,
        markerY: 0.80,
        category: 'room',
        isRoom: true,
        audioUrl: 'chiec_xe_tang_390.mp3',
        imagePath: 'phong_hoi_truong.webp',
      ),
      ExhibitEntity(
        id: 'f2_06',
        pinCode: '06',
        name: 'Phòng làm việc của Tổng thống',
        description:
            'Văn phòng chỉ huy tối cao, nơi làm việc hàng ngày của Tổng thống.',
        floor: 2,
        markerX: 0.25,
        markerY: 0.60,
        category: 'room',
        isRoom: true,
        audioUrl: 'chiec_xe_tang_390.mp3',
        imagePath: 'phong_hoi_truong.webp',
      ),
      ExhibitEntity(
        id: 'f2_07',
        pinCode: '07',
        name: 'Phòng tiếp khách của Tổng thống',
        description:
            'Không gian tiếp đón các phái đoàn quốc tế và nhân vật quan trọng.',
        floor: 2,
        markerX: 0.45,
        markerY: 0.70,
        category: 'room',
        isRoom: true,
        audioUrl: 'chiec_xe_tang_390.mp3',
        imagePath: 'phong_hoi_truong.webp',
      ),
      ExhibitEntity(
        id: 'f2_08',
        pinCode: '08',
        name: 'Phòng tiếp khách của Phó Tổng thống',
        description:
            'Khu vực làm việc và tiếp khách riêng biệt của Phó Tổng thống.',
        floor: 2,
        markerX: 0.40,
        markerY: 0.50,
        category: 'room',
        isRoom: true,
        audioUrl: 'chiec_xe_tang_390.mp3',
        imagePath: 'phong_hoi_truong.webp',
      ),
      ExhibitEntity(
        id: 'f2_09',
        pinCode: '09',
        name: 'Phòng làm việc của Phó Tổng thống',
        description:
            'Văn phòng của nhân vật quyền lực thứ hai trong hệ thống chính trị.',
        floor: 2,
        markerX: 0.85,
        markerY: 0.70,
        category: 'room',
        isRoom: true,
        audioUrl: 'chiec_xe_tang_390.mp3',
        imagePath: 'phong_hoi_truong.webp',
      ),
      ExhibitEntity(
        id: 'f2_10',
        pinCode: '10',
        name: 'Phòng ngủ Tổng thống',
        description: 'Phòng nghỉ ngơi của Tổng thống tại lầu 2.',
        floor: 2,
        markerX: 0.85,
        markerY: 0.35,
        category: 'room',
        isRoom: true,
        audioUrl: 'chiec_xe_tang_390.mp3',
        imagePath: 'phong_hoi_truong.webp',
      ),
      ExhibitEntity(
        id: 'f2_11',
        pinCode: '11',
        name: 'Phòng trình quốc thư',
        description:
            'Nơi diễn ra nghi lễ ngoại giao quan trọng nhất - nhận quốc thư từ Đại sứ các nước.',
        floor: 2,
        markerX: 0.50,
        markerY: 0.40,
        category: 'room',
        isRoom: true,
        audioUrl: 'chiec_xe_tang_390.mp3',
        imagePath: 'phong_hoi_truong.webp',
      ),
      ExhibitEntity(
        id: 'f2_12',
        pinCode: '12',
        name: 'Khu gia đình Tổng thống',
        description:
            'Khu vực sinh hoạt riêng tư, biệt lập của gia đình Tổng thống.',
        floor: 2,
        markerX: 0.75,
        markerY: 0.50,
        category: 'room',
        isRoom: true,
        audioUrl: 'chiec_xe_tang_390.mp3',
        imagePath: 'phong_hoi_truong.webp',
      ),
    ],
  );

  // ─── TẦNG 1 / 1ST FLOOR ─────────────────────────────────────
  static final FloorEntity _floor1 = FloorEntity(
    floorNumber: 1,
    name: 'Tầng 1',
    mapImagePath: 'assets/images/map/1st.png',
    exhibits: const [
      ExhibitEntity(
        id: 'f1_01',
        pinCode: '01',
        name: 'Phòng nội các',
        description:
            'Phòng họp chính phủ, nơi Nội các báo cáo tình hình hàng tuần.',
        floor: 1,
        markerX: 0.70,
        markerY: 0.40,
        category: 'room',
        isRoom: true,
        audioUrl: 'chiec_xe_tang_390.mp3',
        imagePath: 'phong_hoi_truong.webp',
      ),
      ExhibitEntity(
        id: 'f1_02',
        pinCode: '02',
        name: 'Phòng Đại yến',
        description:
            'Sức chứa lớn để tổ chức các buổi khánh tiết, chiêu đãi trọng thể.',
        floor: 1,
        markerX: 0.50,
        markerY: 0.70,
        category: 'room',
        isRoom: true,
        audioUrl: 'chiec_xe_tang_390.mp3',
        imagePath: 'phong_hoi_truong.webp',
      ),
      ExhibitEntity(
        id: 'f1_03',
        pinCode: '03',
        name: 'Cầu thang trung tâm',
        description: 'Cầu thang đại sảnh bề thế dẫn từ tầng trệt lên lầu 1.',
        floor: 1,
        markerX: 0.55,
        markerY: 0.55,
        category: 'room',
        isRoom: false,
        audioUrl: 'chiec_xe_tang_390.mp3',
        imagePath: 'phong_hoi_truong.webp',
      ),
      ExhibitEntity(
        id: 'f1_04',
        pinCode: '04',
        name: 'Phòng Khánh tiết',
        description:
            'Phòng sang trọng chuyên dùng cho các sự kiện nghi lễ và lễ nhậm chức.',
        floor: 1,
        markerX: 0.35,
        markerY: 0.40,
        category: 'room',
        isRoom: true,
        audioUrl: 'chiec_xe_tang_390.mp3',
        imagePath: 'phong_hoi_truong.webp',
      ),
    ],
  );

  // ─── TẦNG TRỆT / GROUND FLOOR ─────────────────────────────────
  static final FloorEntity _groundFloor = FloorEntity(
    floorNumber: 0,
    name: 'Tầng Trệt',
    mapImagePath: 'assets/images/map/ground.png',
    exhibits: const [
      ExhibitEntity(
        id: 'gf_25',
        pinCode: '25',
        name: 'Bếp',
        description:
            'Hệ thống bếp công nghiệp công suất lớn phục vụ các buổi đại yến.',
        floor: 0,
        markerX: 0.25,
        markerY: 0.85,
        category: 'room',
        isRoom: true,
        audioUrl: 'chiec_xe_tang_390.mp3',
        imagePath: 'phong_hoi_truong.webp',
      ),
      ExhibitEntity(
        id: 'gf_26',
        pinCode: '26',
        name: 'Xe Jeep',
        description:
            'Chiếc xe Jeep M151A2 lịch sử dùng để di chuyển và hộ tống.',
        floor: 0,
        markerX: 0.55,
        markerY: 0.60,
        category: 'artifact',
        isRoom: false,
        audioUrl: 'chiec_xe_tang_390.mp3',
        imagePath: 'phong_hoi_truong.webp',
      ),
      ExhibitEntity(
        id: 'gf_27',
        pinCode: '27',
        name: 'Cửa hàng lưu niệm',
        description:
            'Nơi du khách có thể mua các món đồ kỷ niệm mang dấu ấn Dinh Độc Lập.',
        floor: 0,
        markerX: 0.40,
        markerY: 0.55,
        category: 'room',
        isRoom: true,
        audioUrl: 'chiec_xe_tang_390.mp3',
        imagePath: 'phong_hoi_truong.webp',
      ),
      ExhibitEntity(
        id: 'gf_28',
        pinCode: '28',
        name: 'Xe Mercedes',
        description:
            'Chiếc xe Mercedes Benz 200 W110 từng đưa đón Tổng thống Nguyễn Văn Thiệu.',
        floor: 0,
        markerX: 0.70,
        markerY: 0.50,
        category: 'artifact',
        isRoom: false,
        audioUrl: 'chiec_xe_tang_390.mp3',
        imagePath: 'phong_hoi_truong.webp',
      ),
      ExhibitEntity(
        id: 'gf_29',
        pinCode: '29',
        name: 'Câu lạc bộ trẻ em',
        description:
            'Khu vực giải trí, trông giữ trẻ em cho các nhân viên hoặc khách tham quan.',
        floor: 0,
        markerX: 0.50,
        markerY: 0.40,
        category: 'room',
        isRoom: true,
        audioUrl: 'chiec_xe_tang_390.mp3',
        imagePath: 'phong_hoi_truong.webp',
      ),
      ExhibitEntity(
        id: 'gf_30',
        pinCode: '30',
        name: 'Phòng tập bắn',
        description:
            'Phòng tập tác xạ khép kín để rèn luyện kỹ năng sử dụng vũ khí.',
        floor: 0,
        markerX: 0.45,
        markerY: 0.30,
        category: 'room',
        isRoom: true,
        audioUrl: 'chiec_xe_tang_390.mp3',
        imagePath: 'phong_hoi_truong.webp',
      ),
      ExhibitEntity(
        id: 'gf_31',
        pinCode: '31',
        name: 'Phim tư liệu',
        description:
            'Phòng chiếu các đoạn phim tài liệu lịch sử về Dinh Độc Lập.',
        floor: 0,
        markerX: 0.30,
        markerY: 0.75,
        category: 'room',
        isRoom: true,
        audioUrl: 'chiec_xe_tang_390.mp3',
        imagePath: 'phong_hoi_truong.webp',
      ),
    ],
  );

  // ─── TẦNG HẦM / BUNKER ──────────────────────────────────────
  static final FloorEntity _basement = FloorEntity(
    floorNumber: -1,
    name: 'Tầng Hầm',
    mapImagePath: 'assets/images/map/bunker.png',
    exhibits: const [
      ExhibitEntity(
        id: 'b_19',
        pinCode: '19',
        name: 'Phòng Tham mưu tác chiến',
        description:
            'Trung tâm đầu não chỉ huy với hệ thống bản đồ quân sự phức tạp.',
        floor: -1,
        markerX: 0.30,
        markerY: 0.60,
        category: 'room',
        isRoom: true,
        audioUrl: 'chiec_xe_tang_390.mp3',
        imagePath: 'phong_hoi_truong.webp',
      ),
      ExhibitEntity(
        id: 'b_20',
        pinCode: '20',
        name: 'Đài phát thanh dự phòng',
        description:
            'Hệ thống đài phát thanh khẩn cấp để duy trì tiếng nói của chính quyền nếu đài phát thanh quốc gia bị phá hủy.',
        floor: -1,
        markerX: 0.40,
        markerY: 0.60,
        category: 'room',
        isRoom: true,
        audioUrl: 'chiec_xe_tang_390.mp3',
        imagePath: 'phong_hoi_truong.webp',
      ),
      ExhibitEntity(
        id: 'b_21',
        pinCode: '21',
        name: 'Thông tin liên lạc',
        description:
            'Nơi tiếp nhận và xử lý mọi luồng thông tin tình báo, điện tín.',
        floor: -1,
        markerX: 0.50,
        markerY: 0.60,
        category: 'room',
        isRoom: true,
        audioUrl: 'chiec_xe_tang_390.mp3',
        imagePath: 'phong_hoi_truong.webp',
      ),
      ExhibitEntity(
        id: 'b_22',
        pinCode: '22',
        name: 'Phòng ngủ Tổng thống',
        description:
            'Nơi lánh nạn và nghỉ ngơi an toàn của Tổng thống trong trường hợp bị không kích.',
        floor: -1,
        markerX: 0.60,
        markerY: 0.40,
        category: 'room',
        isRoom: true,
        audioUrl: 'chiec_xe_tang_390.mp3',
        imagePath: 'phong_hoi_truong.webp',
      ),
      ExhibitEntity(
        id: 'b_23',
        pinCode: '23',
        name: 'Phòng trực chiến của Tổng thống',
        description:
            'Văn phòng làm việc thu nhỏ dưới hầm sâu ghép nối trực tiếp với các tướng lĩnh quân đội.',
        floor: -1,
        markerX: 0.70,
        markerY: 0.40,
        category: 'room',
        isRoom: true,
        audioUrl: 'chiec_xe_tang_390.mp3',
        imagePath: 'phong_hoi_truong.webp',
      ),
      ExhibitEntity(
        id: 'b_24',
        pinCode: '24',
        name: 'Phòng An ninh',
        description:
            'Chốt kiểm soát an ninh tối đa lối xuống và toàn bộ Tầng hầm.',
        floor: -1,
        markerX: 0.80,
        markerY: 0.40,
        category: 'room',
        isRoom: true,
        audioUrl: 'chiec_xe_tang_390.mp3',
        imagePath: 'phong_hoi_truong.webp',
      ),
    ],
  );
}
