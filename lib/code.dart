import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

var fonts = {
  "Montserrat": GoogleFonts.asMap()[""],
};

program() {
  final text = GoogleFonts.asMap();
  final t = (text[fonts['Montserrat']]!)();
  // GoogleFonts.getFont(t())

  Text(
    "d",
    style: t,
  );
  for (var element in GoogleFonts.asMap().entries) {
    print(element.key);
  }
}
