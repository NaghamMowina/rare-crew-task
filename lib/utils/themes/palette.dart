//palette.dart
import 'package:flutter/material.dart';

class Palette {
  static const MaterialColor kBlue = const MaterialColor(
    0xff0000CE, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
    const <int, Color>{
      50: const Color(0xffe0e0ff), //10%
      100: const Color(0xffbfc2ff), //20%
      200: const Color(0xff9da3ff), //30%
      300: const Color(0xff7c84ff), //40%
      400: const Color(0xff5a64ff), //50%
      500: const Color(0xff3b44ed), //60%
      600: const Color(0xff1b21d7), //70%
      700: const Color(0xff0000ac), //80%
      800: const Color(0xff00006e), //90%
      900: const Color(0xff000000), //100%
    },
  );
}
