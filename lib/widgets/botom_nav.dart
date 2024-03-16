import 'package:flutter/material.dart';

class BottomBar extends StatefulWidget {
  final int currentPage;
  final void Function(int) onPageChanged;

  const BottomBar({
    Key? key,
    required this.currentPage,
    required this.onPageChanged,
  }) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: BottomNavigationBar(
        selectedItemColor: Colors.white,
        // selectedIconTheme: IconThemeData(size: 30),
        // unselectedIconTheme:
        //     IconThemeData(size: 30), // Set the selected item color
        backgroundColor: Color(0xed141414),
        selectedFontSize: 0,
        unselectedFontSize: 0,
        currentIndex: widget.currentPage,
        onTap: widget.onPageChanged,
        iconSize: 35,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: SizedBox(
              width: 4,
            ), // Create an empty space
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.block),
            label: "",
          ),
        ],
      ),
    );
  }
}
