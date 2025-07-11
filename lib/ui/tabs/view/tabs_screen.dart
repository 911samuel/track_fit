import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:track_fit/core/theme/app_colors.dart';
import 'package:track_fit/core/theme/app_dimensions.dart';
import 'package:track_fit/ui/dashboard/view/dashboard_screen.dart';

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
   DashboardScreen()
  ];

  void _onTappedItem(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onTappedItem,
        backgroundColor: AppColors.cardGray,
        selectedItemColor: AppColors.primaryNeon,
        unselectedItemColor: AppColors.textLightGray,
        type: BottomNavigationBarType.fixed,
        elevation: AppDimensions.bottomNavElevation,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.directions_run),
            label: 'Jog',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.group), label: 'Friends'),
          BottomNavigationBarItem(
            icon: Icon(Icons.directions_bike),
            label: 'Cycling',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
