import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../home/presentation/home_screen.dart';
import '../../pin_entry/presentation/pin_entry_screen.dart';
import '../../map/presentation/map_screen.dart';

class MainScreen extends StatefulWidget {
  final int initialIndex;

  const MainScreen({super.key, this.initialIndex = 0});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late int _currentIndex;

  final List<Widget> _screens = [
    const HomeScreen(),
    const PinEntryScreen(),
    const MapScreen(),
  ];

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
  }

  void _onTabTapped(int index) {
    if (_currentIndex != index) {
      setState(() {
        _currentIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
        backgroundColor: AppColors.primaryDark,
        selectedItemColor: AppColors.gold,
        unselectedItemColor: Colors.white60,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt_rounded),
            label: 'Danh sách',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.keyboard_alt_outlined),
            label: 'Bàn phím',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map_rounded),
            label: 'Bản đồ',
          ),
        ],
      ),
    );
  }
}
