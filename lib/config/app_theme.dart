import 'package:flutter/material.dart';

const int _primaryColor = 0xFF0c7d7d;

const MaterialColor primarySwatch = MaterialColor(_primaryColor, <int, Color>{
  /// This is the only difference between light and dark themes
  50: Color(0x180C7D7D),
  100: Color(0x330C7D7D),
  200: Color(0x4B0C7D7D),
  300: Color(0x660C7D7D),
  400: Color(0x7E0C7D7D),
  500: Color(0x990C7D7D), // Adjusted color code
  600: Color(0xB10C7D7D),
  700: Color(0xCC0C7D7D),
  800: Color(0xE40C7D7D),
  900: Color(_primaryColor),
});

const int _textColor = 0xFF64748B;
const MaterialColor textSwatch = MaterialColor(_textColor, <int, Color>{
  /// This is the only difference between light and dark themes
  50: Color(0xFFF8FAFC),
  100: Color(0xFFF1F5F9),
  200: Color(0xFFE2E8F0),
  300: Color(0xFFCBD5E1),
  400: Color(0xFF94A3B8),
  500: Color(_textColor),
  600: Color(0xFF475569),
  700: Color(0xFF334155),
  800: Color(0xFF1E293B),
  900: Color(0xFF0F172A),
});

const Color errorColor = Color(0xFFDC2626);

final ColorScheme lightColorScheme = ColorScheme.light(
  /// This is the only difference between light and dark themes
  primary: primarySwatch.shade900,
  secondary: primarySwatch.shade900,
  onSecondary: Colors.white,
  error: errorColor,
  background: textSwatch.shade200,
  onBackground: textSwatch.shade500,
  onSurface: textSwatch.shade500,
  surface: textSwatch.shade100,
  surfaceVariant: Colors.white,
  shadow: textSwatch.shade900.withOpacity(.4),
);

final ColorScheme darkColorScheme = ColorScheme.dark(
  /// This is the only difference between light and dark themes
  primary: primarySwatch.shade900,
  secondary: primarySwatch.shade900,
  onSecondary: Colors.white,
  error: errorColor,
  background: const Color(0xFF171724),
  onBackground: textSwatch.shade400,
  onSurface: textSwatch.shade300,
  surface: const Color(0xFF262630),
  surfaceVariant: const Color(0xFF282832),
  shadow: textSwatch.shade900.withOpacity(.2),
);

final ThemeData lightTheme = ThemeData(
  colorScheme: lightColorScheme,
  fontFamily: 'Poppins',
  textTheme: TextTheme(
    displayLarge: TextStyle(
      color: textSwatch.shade700,
      fontFamily: 'Poppins',
    ),
    displayMedium: TextStyle(
      color: textSwatch.shade600,
      fontFamily: 'Poppins',
    ),
    displaySmall: TextStyle(
      color: textSwatch.shade500,
      fontFamily: 'Poppins',
    ),
    headlineLarge: TextStyle(
      color: textSwatch.shade700,
      fontFamily: 'Poppins',
    ),
    headlineMedium: TextStyle(
      color: textSwatch.shade600,
      fontFamily: 'Poppins',
    ),
    headlineSmall: TextStyle(
      color: textSwatch.shade500,
      fontFamily: 'Poppins',
    ),
    titleLarge: TextStyle(
      color: textSwatch.shade700,
      fontFamily: 'Poppins',
    ),
    titleMedium: TextStyle(
      color: textSwatch.shade600,
      fontFamily: 'Poppins',
    ),
    titleSmall: TextStyle(
      color: textSwatch.shade500,
      fontFamily: 'Poppins',
    ),
    bodyLarge: TextStyle(
      color: textSwatch.shade700,
      fontFamily: 'Poppins',
    ),
    bodyMedium: TextStyle(
      color: textSwatch.shade600,
      fontFamily: 'Poppins',
    ),
    bodySmall: TextStyle(
      color: textSwatch.shade500,
      fontFamily: 'Poppins',
    ),
    labelLarge: TextStyle(
      color: textSwatch.shade700,
      fontFamily: 'Poppins',
    ),
    labelMedium: TextStyle(
      color: textSwatch.shade600,
      fontFamily: 'Poppins',
    ),
    labelSmall: TextStyle(
      color: textSwatch.shade500,
      fontFamily: 'Poppins',
    ),
  ),
  checkboxTheme: CheckboxThemeData(
    /// This is the color of the checkbox when selected
    fillColor:
        MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
      /// This is the color of the checkbox when disabled
      if (states.contains(MaterialState.disabled)) {
        /// This is the color of the checkbox when disabled
        return null;
      }
      if (states.contains(MaterialState.selected)) {
        /// This is the color of the checkbox when selected
        return primarySwatch.shade900;
      }
      return null;
    }),
  ),
  radioTheme: RadioThemeData(
    fillColor:
        MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
      /// This is the color of the radio button when disabled
      if (states.contains(MaterialState.disabled)) {
        /// This is the color of the radio button when disabled
        return null;
      }
      if (states.contains(MaterialState.selected)) {
        /// This is the color of the radio button when selected
        return primarySwatch.shade900;
      }
      return null;
    }),
  ),
  switchTheme: SwitchThemeData(
    /// This is the color of the switch when selected
    thumbColor:
        MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
      if (states.contains(MaterialState.disabled)) {
        /// This is the color of the switch when disabled
        return null;
      }
      if (states.contains(MaterialState.selected)) {
        /// This is the color of the switch when selected
        return primarySwatch.shade900;
      }
      return null;
    }),
    trackColor:
        MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
      /// This is the color of the switch when not selected
      if (states.contains(MaterialState.disabled)) {
        /// This is the color of the switch when disabled
        return null;
      }
      if (states.contains(MaterialState.selected)) {
        /// This is the color of the switch when selected
        return primarySwatch.shade200;
      }
      return null;
    }),
  ),
);

final ThemeData darkTheme = lightTheme.copyWith(
  /// This is the only difference between light and dark themes
  colorScheme: darkColorScheme,
  textTheme: TextTheme(
    displayLarge: TextStyle(
      color: textSwatch.shade200,
      fontFamily: 'Poppins',
    ),
    displayMedium: TextStyle(
      color: textSwatch.shade300,
      fontFamily: 'Poppins',
    ),
    displaySmall: TextStyle(
      color: textSwatch.shade400,
      fontFamily: 'Poppins',
    ),
    headlineLarge: TextStyle(
      color: textSwatch.shade200,
      fontFamily: 'Poppins',
    ),
    headlineMedium: TextStyle(
      color: textSwatch.shade300,
      fontFamily: 'Poppins',
    ),
    headlineSmall: TextStyle(
      color: textSwatch.shade400,
      fontFamily: 'Poppins',
    ),
    titleLarge: TextStyle(
      color: textSwatch.shade200,
      fontFamily: 'Poppins',
    ),
    titleMedium: TextStyle(
      color: textSwatch.shade300,
      fontFamily: 'Poppins',
    ),
    titleSmall: TextStyle(
      color: textSwatch.shade400,
      fontFamily: 'Poppins',
    ),
    bodyLarge: TextStyle(
      color: textSwatch.shade200,
      fontFamily: 'Poppins',
    ),
    bodyMedium: TextStyle(
      color: textSwatch.shade300,
      fontFamily: 'Poppins',
    ),
    bodySmall: TextStyle(
      color: textSwatch.shade400,
      fontFamily: 'Poppins',
    ),
    labelLarge: TextStyle(
      color: textSwatch.shade200,
      fontFamily: 'Poppins',
    ),
    labelMedium: TextStyle(
      color: textSwatch.shade300,
      fontFamily: 'Poppins',
    ),
    labelSmall: TextStyle(
      color: textSwatch.shade400,
      fontFamily: 'Poppins',
    ),
  ),
  checkboxTheme: CheckboxThemeData(
    /// This is the color of the checkbox when selected
    fillColor:
        MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
      if (states.contains(MaterialState.disabled)) {
        /// This is the color of the checkbox when disabled
        return null;
      }
      if (states.contains(MaterialState.selected)) {
        /// This is the color of the checkbox when selected
        return primarySwatch.shade900;
      }
      return null;
    }),
  ),
  radioTheme: RadioThemeData(
    /// This is the color of the radio button when selected
    fillColor:
        MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
      if (states.contains(MaterialState.disabled)) {
        /// This is the color of the radio button when disabled
        return null;
      }
      if (states.contains(MaterialState.selected)) {
        /// This is the color of the radio button when selected
        return primarySwatch.shade900;
      }
      return null;
    }),
  ),
  switchTheme: SwitchThemeData(
    /// This is the color of the switch when selected
    thumbColor:
        MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
      /// This is the color of the switch when selected
      if (states.contains(MaterialState.disabled)) {
        /// This is the color of the switch when disabled
        return null;
      }
      if (states.contains(MaterialState.selected)) {
        /// This is the color of the switch when selected
        return primarySwatch.shade900;
      }
      return null;
    }),
    trackColor:
        MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
      /// This is the color of the switch when not selected
      if (states.contains(MaterialState.disabled)) {
        /// This is the color of the switch when disabled
        return null;
      }
      if (states.contains(MaterialState.selected)) {
        /// This is the color of the switch when selected
        return primarySwatch.shade200;
      }
      return null;
    }),
  ),
);
