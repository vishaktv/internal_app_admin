import 'package:flutter/material.dart';

import 'category_box_item.dart';

class ServiceSection extends StatelessWidget {
  const ServiceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CategoryBoxItem(),
        SizedBox(
          width: 10,
        ),
        CategoryBoxItem(),
        SizedBox(
          width: 10,
        ),
        CategoryBoxItem(),
        SizedBox(
          width: 10,
        ),
        CategoryBoxItem(),
        SizedBox(
          width: 10,
        ),
        CategoryBoxItem(),
      ],
    );
  }
}
