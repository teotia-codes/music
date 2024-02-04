import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class SectionHeader extends StatelessWidget {
  const SectionHeader({
    super.key,required this.title,
    this.action = 'View More',
    required this.width,
  });
final String title;
final String action;
final double  width;
  @override
  Widget build(BuildContext context) {
    return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
      children:[ Text(title,style: GoogleFonts.ubuntu(
                    color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24),),
                     SizedBox(width: width,),
                     Text(action,style: GoogleFonts.ubuntu(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),)
    ]);
  }
}
