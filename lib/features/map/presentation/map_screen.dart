import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../home/domain/entities/floor_entity.dart';
import '../../home/domain/entities/exhibit_entity.dart';
import '../../../../core/di/service_locator.dart';
import '../../../../core/router/app_router.dart';
import '../../intro/presentation/widgets/language_picker_widget.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late List<FloorEntity> _floors;

  @override
  void initState() {
    super.initState();
    _floors = ServiceLocator.getAllFloors();
  }

  @override
  Widget build(BuildContext context) {
    if (_floors.isEmpty) {
      return const Scaffold(body: Center(child: Text('No map data available')));
    }

    return DefaultTabController(
      length: _floors.length,
      child: Scaffold(
        backgroundColor: AppColors.surface,
        appBar: AppBar(
          title: const Text('BẢN ĐỒ'),
          actions: [
            IconButton(
              icon: const Icon(Icons.language_rounded),
              onPressed: () => LanguagePickerWidget.show(context),
            ),
          ],
        ),
        body: Column(
          children: [
            Container(
              color: AppColors.primary,
              child: TabBar(
                isScrollable: true,
                tabAlignment: TabAlignment.start,
                indicatorColor: AppColors.gold,
                indicatorWeight: 3,
                labelColor: AppColors.gold,
                unselectedLabelColor: Colors.white60,
                labelStyle: const TextStyle(fontWeight: FontWeight.bold),
                tabs: _floors.map((f) => Tab(text: f.name)).toList(),
              ),
            ),
            Expanded(
              child: TabBarView(
                physics:
                    const NeverScrollableScrollPhysics(), // Ngăn vuốt để không xung đột chảo/zoom của InteractiveViewer
                children: _floors.map((currentFloor) {
                  return InteractiveViewer(
                    minScale: 0.5,
                    maxScale: 4.0,
                    boundaryMargin: const EdgeInsets.all(100),
                    child: Stack(
                      children: [
                        Center(
                          child: Container(
                            width: 300,
                            height: 400,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: AppColors.divider, width: 2),
                              color: Colors.white,
                            ),
                            child: Stack(
                              fit: StackFit.expand,
                              children: [
                                Center(
                                  child: Text(
                                    'Bản đồ khu vực\n${currentFloor.name}',
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      color: AppColors.divider,
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ),
                                ...currentFloor.exhibits.map((exhibit) {
                                  return _MapMarker(
                                    exhibit: exhibit,
                                    onTap: () {
                                      Navigator.pushNamed(
                                        context,
                                        AppRouter.detail,
                                        arguments: exhibit,
                                      );
                                    },
                                  );
                                }),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MapMarker extends StatelessWidget {
  final ExhibitEntity exhibit;
  final VoidCallback onTap;

  const _MapMarker({
    required this.exhibit,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      // Chuyển đổi tọa độ 0.0 - 1.0 sang phần trăm (so với parent 300x400 giả định)
      left: exhibit.markerX * 300 - 15,
      top: exhibit.markerY * 400 - 15,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
            color: exhibit.isRoom ? AppColors.primary : AppColors.gold,
            shape: BoxShape.circle,
            border: Border.all(
                color: exhibit.isRoom ? AppColors.gold : AppColors.primaryDark,
                width: 2),
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 4,
                offset: Offset(0, 2),
              ),
            ],
          ),
          alignment: Alignment.center,
          child: Text(
            exhibit.pinCode,
            style: TextStyle(
              color: exhibit.isRoom ? Colors.white : AppColors.primaryDark,
              fontSize: 10,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
