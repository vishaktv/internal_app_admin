import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/glass_frosted_container.dart';

class CategoryBoxItem extends StatelessWidget {
  const CategoryBoxItem({super.key});

  @override
  Widget build(BuildContext context) {
    return GlassMorphismFrostedContainer(
      height: 140,
      width: 150,
      start: 0.4,
      end: 0.7,
      child: Container(
        padding: EdgeInsets.only(
          top: 10,
          left: 10,
        ),
        // height: 140,
        // width: 150,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              Icons.block,
              color: Colors.red,
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "API",
              style: GoogleFonts.alegreyaSansSc(
                  fontSize: 22, fontWeight: FontWeight.w800),
            ),
            Transform.translate(
              offset: Offset(0, -8), // Adjust this value as needed
              child: Text(
                "Blocker",
                style: TextStyle(fontSize: 15),
              ),
            ),
            Align(
              heightFactor: 0.9,
              alignment: Alignment.bottomRight,
              child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.arrow_forward,
                  size: 24,
                  weight: 900,
                  color: Colors.grey.shade800,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
