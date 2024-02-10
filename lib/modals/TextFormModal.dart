import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class TextFormModal {
  String text;
  TextStyle textStyle;
  double fontSize;
  Color color;
  double top;
  double left;
  bool isBold;
  TextFormModal({
    required this.text,
    required this.textStyle,
    required this.fontSize,
    required this.color,
    required this.top,
    required this.left,
    this.isBold = false,
  }) {
    assert(text != null);
    assert(textStyle != null);
    this.textStyle = textStyle.copyWith(fontSize: fontSize);
    this.textStyle = textStyle.copyWith(color: color);
  }

  TextFormModal copyWith({
    String? text,
    TextStyle? textStyle,
    double? fontSize,
    Color? color,
    double? top,
    double? left,
    bool? isBold = false,
  }) {
    return TextFormModal(
      text: text ?? this.text,
      textStyle: textStyle ?? this.textStyle,
      fontSize: fontSize ?? this.fontSize,
      color: color ?? this.color,
      top: top ?? this.top,
      left: left ?? this.left,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'text': text,
      'fontSize': fontSize,
      'color': color.value,
      'top': top,
      'left': left,
    };
  }

  factory TextFormModal.fromMap(Map<String, dynamic> map) {
    return TextFormModal(
      text: map['text'] as String,
      textStyle: GoogleFonts.asMap()[map['textStyle']] == null
          ? TextStyle()
          : GoogleFonts.asMap()[map['textStyle']]!(),
      fontSize: map['fontSize'] as double,
      color: Color.fromRGBO(
        int.parse(map['color'].split(',')[0]),
        int.parse(map['color'].split(',')[1]),
        int.parse(map['color'].split(',')[2]),
        1.0,
      ),
      top: map['top'] as double,
      left: map['left'] as double,
    );
  }
//  Color getColorFromRGBString(String rgbString) => Color.fromRGBO(int.parse(rgbString.split(',')[0]), int.parse(rgbString.split(',')[1]), int.parse(rgbString.split(',')[2]), 1.0);

  String toJson() => json.encode(toMap());

  factory TextFormModal.fromJson(String source) =>
      TextFormModal.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'TextFormModal(text: $text, textStyle: $textStyle, fontSize: $fontSize, color: $color, top: $top, left: $left, isBold=flase: $isBold=flase)';
  }
}
