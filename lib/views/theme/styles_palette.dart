import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StylesPalette {
  const StylesPalette({
    required this.bold20,
    required this.bold16,
    required this.semibold24,
    required this.semibold16,
    required this.semibold12,
    required this.medium32,
    required this.medium24,
    required this.medium16,
    required this.medium12,
    required this.medium10,
    required this.medium8,
    required this.regular16,
    required this.regular12,
    required this.regular10,
    required this.light24,
    required this.light10,
  });

  final TextStyle bold20;
  final TextStyle bold16;
  final TextStyle semibold24;
  final TextStyle semibold16;
  final TextStyle semibold12;
  final TextStyle medium32;
  final TextStyle medium24;
  final TextStyle medium16;
  final TextStyle medium12;
  final TextStyle medium10;
  final TextStyle medium8;
  final TextStyle regular16;
  final TextStyle regular12;
  final TextStyle regular10;
  final TextStyle light24;
  final TextStyle light10;
}

class Roboto {
  const Roboto._();

  static const fontFamily = GoogleFonts.roboto;

  static TextStyle bold20 = fontFamily(
    textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
  );

  static TextStyle bold16 = fontFamily(
    textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
  );

  static TextStyle semibold24 = fontFamily(
    textStyle: const TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
  );

  static TextStyle semibold16 = fontFamily(
    textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
  );

  static TextStyle semibold12 = fontFamily(
    textStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
  );

  static TextStyle medium32 = fontFamily(
    textStyle: const TextStyle(fontSize: 32, fontWeight: FontWeight.w500),
  );

  static TextStyle medium24 = fontFamily(
    textStyle: const TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
  );

  static TextStyle medium16 = fontFamily(
    textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
  );

  static TextStyle medium12 = fontFamily(
    textStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
  );

  static TextStyle medium10 = fontFamily(
    textStyle: const TextStyle(fontSize: 10, fontWeight: FontWeight.w500),
  );

  static TextStyle medium8 = fontFamily(
    textStyle: const TextStyle(fontSize: 8, fontWeight: FontWeight.w500),
  );

  static TextStyle regular16 = fontFamily(
    textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
  );

  static TextStyle regular12 = fontFamily(
    textStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
  );

  static TextStyle regular10 = fontFamily(
    textStyle: const TextStyle(fontSize: 10, fontWeight: FontWeight.w400),
  );

  static TextStyle light24 = fontFamily(
    textStyle: const TextStyle(fontSize: 24, fontWeight: FontWeight.w300),
  );

  static TextStyle light10 = fontFamily(
    textStyle: const TextStyle(fontSize: 10, fontWeight: FontWeight.w300),
  );
}
