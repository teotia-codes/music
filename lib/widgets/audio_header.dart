import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class SectionHeader extends StatelessWidget {
  const SectionHeader({
    super.key,required this.title,
    this.action = 'View More'
  });
final String title;
final String action;
  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.end,
      children:[ Text(title,style: GoogleFonts.ubuntu(
                    color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24),),
                     const SizedBox(width: 100,),
                     Text(action,style: GoogleFonts.ubuntu(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),)
    ]);
  }
}
