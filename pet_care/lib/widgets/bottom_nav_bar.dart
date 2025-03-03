import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const BottomNavBar({
    Key? key,
    required this.currentIndex,
    required this.onTap,
  }): super(key: key);

  @override
  Widget build (BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.grid_view),
          label: "Trang chủ",
        ),
        // BottomNavigationBarItem(
        //   icon: Icon(Icons.event_available),
        //   label: "Đặt lịch",
        // ),
        // BottomNavigationBarItem(
        //   icon: Icon(Icons.pets_outlined),
        //   label: "Hồ sơ",
        // ),
        // BottomNavigationBarItem(
        //   icon: Icon(Icons.chat),
        //   label: "Chat",
        // ),
        BottomNavigationBarItem(
          icon: Icon(Icons.perm_identity),
          label: "Tài khoản",
        ),
      ]

    );
  }
}