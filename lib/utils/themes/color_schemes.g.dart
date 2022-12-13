import 'package:flutter/material.dart';
import 'package:rare_task/utils/themes/palette.dart';

class ColorSchemes {
  static const lightColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xFF3B44ED),
    onPrimary: Color(0xFFFFFFFF),
    primaryContainer: Color(0xFFE0E0FF),
    onPrimaryContainer: Color(0xFF00006E),
    secondary: Color(0xFF994600),
    onSecondary: Color(0xFFFFFFFF),
    secondaryContainer: Color(0xFFFFDBC8),
    onSecondaryContainer: Color(0xFF321200),
    tertiary: Color(0xFF90427B),
    onTertiary: Color(0xFFFFFFFF),
    tertiaryContainer: Color(0xFFFFD8EE),
    onTertiaryContainer: Color(0xFF3A0030),
    error: Color(0xFFBA1A1A),
    errorContainer: Color(0xFFFFDAD6),
    onError: Color(0xFFFFFFFF),
    onErrorContainer: Color(0xFF410002),
    background: Color(0xFFFDFBFF),
    onBackground: Color(0xFF001B3D),
    surface: Color(0xFFFDFBFF),
    onSurface: Color(0xFF001B3D),
    surfaceVariant: Color(0xFFE4E1EC),
    onSurfaceVariant: Color(0xFF46464F),
    outline: Color(0xFF777680),
    onInverseSurface: Color(0xFFECF0FF),
    inverseSurface: Color(0xFF003062),
    inversePrimary: Color(0xFFBFC2FF),
    shadow: Color(0xFF000000),
    surfaceTint: Color(0xFF3B44ED),
    // outlineVariant: Color(0xFFC7C5D0),
    // scrim: Color(0xFF000000),
  );

  static const darkColorScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: Color(0xFFBFC2FF),
    onPrimary: Color(0xFF0000AC),
    primaryContainer: Color(0xFF1B21D7),
    onPrimaryContainer: Color(0xFFE0E0FF),
    secondary: Color(0xFFFFB68B),
    onSecondary: Color(0xFF522300),
    secondaryContainer: Color(0xFF753400),
    onSecondaryContainer: Color(0xFFFFDBC8),
    tertiary: Color(0xFFFFADE3),
    onTertiary: Color(0xFF581149),
    tertiaryContainer: Color(0xFF742A61),
    onTertiaryContainer: Color(0xFFFFD8EE),
    error: Color(0xFFFFB4AB),
    errorContainer: Color(0xFF93000A),
    onError: Color(0xFF690005),
    onErrorContainer: Color(0xFFFFDAD6),
    background: Color(0xFF001B3D),
    onBackground: Color(0xFFD6E3FF),
    surface: Color(0xFF001B3D),
    onSurface: Color(0xFFD6E3FF),
    surfaceVariant: Color(0xFF46464F),
    onSurfaceVariant: Color(0xFFC7C5D0),
    outline: Color(0xFF91909A),
    onInverseSurface: Color(0xFF001B3D),
    inverseSurface: Color(0xFFD6E3FF),
    inversePrimary: Color(0xFF3B44ED),
    shadow: Color(0xFF000000),
    surfaceTint: Color(0xFFBFC2FF),
    // outlineVariant: Color(0xFF46464F),
    // scrim: Color(0xFF000000),
  );
}

class TextThemes {
  static const lightTextTheme = TextTheme(
    headline1: TextStyle(
      color: Colors.black,
    ),
    headline2: TextStyle(
      color: Colors.black,
    ),
    headline3: TextStyle(
      color: Colors.black,
    ),
    headline4: TextStyle(
      color: Colors.black,
    ),
    headline5: TextStyle(
      color: Colors.black,
    ),
    headline6: TextStyle(
      color: Colors.black,
    ),
    subtitle1: TextStyle(
      color: Colors.black,
    ),
    subtitle2: TextStyle(
      color: Colors.black,
    ),
    bodyText1: TextStyle(
      color: Colors.black,
    ),
    bodyText2: TextStyle(
      color: Colors.black,
    ),
    caption: TextStyle(
      color: Colors.black,
    ),
    button: TextStyle(
      color: Colors.black,
    ),
    overline: TextStyle(
      color: Colors.black,
    ),
  );
  static const darkTextTheme = TextTheme(
    headline1: TextStyle(
      color: Colors.white,
    ),
    headline2: TextStyle(
      color: Colors.white,
    ),
    headline3: TextStyle(
      color: Colors.white,
    ),
    headline4: TextStyle(
      color: Colors.white,
    ),
    headline5: TextStyle(
      color: Colors.white,
    ),
    headline6: TextStyle(
      color: Colors.white,
    ),
    subtitle1: TextStyle(
      color: Colors.white,
    ),
    subtitle2: TextStyle(
      color: Colors.white,
    ),
    bodyText1: TextStyle(
      color: Colors.white,
    ),
    bodyText2: TextStyle(
      color: Colors.white,
    ),
    caption: TextStyle(
      color: Colors.white,
    ),
    button: TextStyle(
      color: Colors.white,
    ),
    overline: TextStyle(
      color: Colors.white,
    ),
  );
}

class IconThemes {
  static const lightIconTheme = IconThemeData(
    color: Color(0xFFFF8E42),
  );
}

class AppBarThemes {
  static const lightAppBarTheme = AppBarTheme(
    elevation: 0,
    color: Colors.transparent,
    iconTheme: IconThemes.lightIconTheme,
    actionsIconTheme: IconThemes.lightIconTheme,
  );
}

class ButtonThemes {
  static const lightButtonTheme = ButtonThemeData(
    buttonColor: Palette.kBlue,
    textTheme: ButtonTextTheme.primary,
    focusColor: Palette.kBlue,
    hoverColor: Palette.kBlue,
    highlightColor: Palette.kBlue,
    splashColor: Palette.kBlue,
  );
}

class bottomNavigationBarTheme {
  static const lightBottomNavigationBarTheme = BottomNavigationBarThemeData(
    backgroundColor: Color(0xFF333333),
    selectedItemColor: Color(0xFF000000),
    unselectedItemColor: Color(0xFFE8E5E7),
  );
}
