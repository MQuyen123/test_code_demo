import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../home/domain/entities/floor_entity.dart';
import '../../home/domain/entities/exhibit_entity.dart';
import '../../../../core/di/service_locator.dart';
import '../../../../core/router/app_router.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late List<FloorEntity> _floors;
  int _selectedFloorIndex = 0;

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

    final currentFloor = _floors[_selectedFloorIndex];

    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: AppBar(
        title: const Text('BẢN ĐỒ'),
      ),
      body: Column(
        children: [
          Container(
            color: AppColors.primary,
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: List.generate(_floors.length, (index) {
                  final isSelected = _selectedFloorIndex == index;
                  return Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: ChoiceChip(
                      label: Text(
                        _floors[index].name,
                        style: TextStyle(
                          color:
                              isSelected ? AppColors.primaryDark : Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      selected: isSelected,
                      selectedColor: AppColors.gold,
                      backgroundColor: Colors.white24,
                      onSelected: (selected) {
                        if (selected) {
                          setState(() => _selectedFloorIndex = index);
                        }
                      },
                    ),
                  );
                }),
              ),
            ),
          ),
          Expanded(
            child: InteractiveViewer(
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
                        border: Border.all(color: AppColors.divider, width: 2),
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
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
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
            ),
          ),
        ],
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
            color: AppColors.primary,
            shape: BoxShape.circle,
            border: Border.all(color: AppColors.gold, width: 2),
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
            style: const TextStyle(
              color: Colors.white,
              fontSize: 10,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
