import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CredAiHeader extends StatelessWidget {
  const CredAiHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        RichText(
          text: TextSpan(
            children: <TextSpan>[
              TextSpan(
                  text: 'cred',
                  style: GoogleFonts.nunitoSans(
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                    fontSize: 85,
                    letterSpacing: -2.5,
                  )),
              TextSpan(
                  text: '.ai',
                  style: GoogleFonts.nunitoSans(
                    fontSize: 85,
                    fontWeight: FontWeight.w100,
                    color: Colors.white,
                    letterSpacing: -8,
                  )),
            ],
          ),
        ),
        Text("Admin",
            style: GoogleFonts.dancingScript(
                fontSize: 35,
                fontWeight: FontWeight.w600,
                color: Colors.white,
                height: -0.1))
      ],
    );
  }
}
