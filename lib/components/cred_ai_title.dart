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
                    fontSize: 30,
                    letterSpacing: -2,
                  )),
              TextSpan(
                  text: '.ai ',
                  style: GoogleFonts.nunitoSans(
                    fontSize: 30,
                    fontWeight: FontWeight.w100,
                    color: Colors.white,
                    letterSpacing: -2,
                  )),
              TextSpan(
                  text: "Admin",
                  style: GoogleFonts.dancingScript(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      letterSpacing: 1))
            ],
          ),
        ),
      ],
    );
  }
}
