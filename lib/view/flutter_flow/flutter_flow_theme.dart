// ignore_for_file: overridden_fields, annotate_overrides

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:shared_preferences/shared_preferences.dart';

const kThemeModeKey = '__theme_mode__';
SharedPreferences? _prefs;

abstract class FlutterFlowTheme {
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static ThemeMode get themeMode {
    final darkMode = _prefs?.getBool(kThemeModeKey);
    return darkMode == null
        ? ThemeMode.system
        : darkMode
        ? ThemeMode.dark
        : ThemeMode.light;
  }

  static void saveThemeMode(ThemeMode mode) => mode == ThemeMode.system
      ? _prefs?.remove(kThemeModeKey)
      : _prefs?.setBool(kThemeModeKey, mode == ThemeMode.dark);

  static FlutterFlowTheme of(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? DarkModeTheme()
        : LightModeTheme();
  }

  @Deprecated('Use primary instead')
  Color get primaryColor => primary;
  @Deprecated('Use secondary instead')
  Color get secondaryColor => secondary;
  @Deprecated('Use tertiary instead')
  Color get tertiaryColor => tertiary;

  late Color primary;
  late Color secondary;
  late Color tertiary;
  late Color alternate;
  late Color primaryText;
  late Color secondaryText;
  late Color primaryBackground;
  late Color secondaryBackground;
  late Color accent1;
  late Color accent2;
  late Color accent3;
  late Color accent4;
  late Color success;
  late Color warning;
  late Color error;
  late Color info;

  late Color borderColor;
  late Color iconColor;
  late Color buttonColor;
  late Color btnText;
  late Color lineColor;
  late Color customColor3;
  late Color customColor4;
  late Color white;
  late Color background;
  late Color borderSecondary;
  late Color iconblueContainer;
  late Color iconbluecolour;
  late Color iconeditcontainer;
  late Color iconeditcolour;
  late Color iconContailnerMain;
  late Color divider;
  late Color iconbluecolour2;
  late Color deletebtncontainer;
  late Color boxShadowcolour;
  late Color whitecontainer;
  late Color iconcontainerdashboard;
  late Color loginPageColour;
  late Color primaryBtnText;
  late Color greencontainer;

  @Deprecated('Use displaySmallFamily instead')
  String get title1Family => displaySmallFamily;
  @Deprecated('Use displaySmall instead')
  TextStyle get title1 => typography.displaySmall;
  @Deprecated('Use headlineMediumFamily instead')
  String get title2Family => typography.headlineMediumFamily;
  @Deprecated('Use headlineMedium instead')
  TextStyle get title2 => typography.headlineMedium;
  @Deprecated('Use headlineSmallFamily instead')
  String get title3Family => typography.headlineSmallFamily;
  @Deprecated('Use headlineSmall instead')
  TextStyle get title3 => typography.headlineSmall;
  @Deprecated('Use titleMediumFamily instead')
  String get subtitle1Family => typography.titleMediumFamily;
  @Deprecated('Use titleMedium instead')
  TextStyle get subtitle1 => typography.titleMedium;
  @Deprecated('Use titleSmallFamily instead')
  String get subtitle2Family => typography.titleSmallFamily;
  @Deprecated('Use titleSmall instead')
  TextStyle get subtitle2 => typography.titleSmall;
  @Deprecated('Use bodyMediumFamily instead')
  String get bodyText1Family => typography.bodyMediumFamily;
  @Deprecated('Use bodyMedium instead')
  TextStyle get bodyText1 => typography.bodyMedium;
  @Deprecated('Use bodySmallFamily instead')
  String get bodyText2Family => typography.bodySmallFamily;
  @Deprecated('Use bodySmall instead')
  TextStyle get bodyText2 => typography.bodySmall;

  String get displayLargeFamily => typography.displayLargeFamily;
  TextStyle get displayLarge => typography.displayLarge;
  String get displayMediumFamily => typography.displayMediumFamily;
  TextStyle get displayMedium => typography.displayMedium;
  String get displaySmallFamily => typography.displaySmallFamily;
  TextStyle get displaySmall => typography.displaySmall;
  String get headlineLargeFamily => typography.headlineLargeFamily;
  TextStyle get headlineLarge => typography.headlineLarge;
  String get headlineMediumFamily => typography.headlineMediumFamily;
  TextStyle get headlineMedium => typography.headlineMedium;
  String get headlineSmallFamily => typography.headlineSmallFamily;
  TextStyle get headlineSmall => typography.headlineSmall;
  String get titleLargeFamily => typography.titleLargeFamily;
  TextStyle get titleLarge => typography.titleLarge;
  String get titleMediumFamily => typography.titleMediumFamily;
  TextStyle get titleMedium => typography.titleMedium;
  String get titleSmallFamily => typography.titleSmallFamily;
  TextStyle get titleSmall => typography.titleSmall;
  String get labelLargeFamily => typography.labelLargeFamily;
  TextStyle get labelLarge => typography.labelLarge;
  String get labelMediumFamily => typography.labelMediumFamily;
  TextStyle get labelMedium => typography.labelMedium;
  String get labelSmallFamily => typography.labelSmallFamily;
  TextStyle get labelSmall => typography.labelSmall;
  String get bodyLargeFamily => typography.bodyLargeFamily;
  TextStyle get bodyLarge => typography.bodyLarge;
  String get bodyMediumFamily => typography.bodyMediumFamily;
  TextStyle get bodyMedium => typography.bodyMedium;
  String get bodySmallFamily => typography.bodySmallFamily;
  TextStyle get bodySmall => typography.bodySmall;

  Typography get typography => ThemeTypography(this);
}

class LightModeTheme extends FlutterFlowTheme {
  @Deprecated('Use primary instead')
  Color get primaryColor => primary;
  @Deprecated('Use secondary instead')
  Color get secondaryColor => secondary;
  @Deprecated('Use tertiary instead')
  Color get tertiaryColor => tertiary;

  late Color primary = const Color(0xFFEEEEEE);
  late Color secondary = const Color(0xFFECF7FD);
  late Color tertiary = const Color(0xFFBAEFE3);
  late Color alternate = const Color(0xFFFFFFFF);
  late Color primaryText = const Color(0xFF838B96);
  late Color secondaryText = const Color(0xFF8C8F90);
  late Color primaryBackground = const Color(0xFFF1F4F8);
  late Color secondaryBackground = const Color(0xFFFFFFFF);
  late Color accent1 = const Color(0xFF616161);
  late Color accent2 = const Color(0xFF757575);
  late Color accent3 = const Color(0xFFE0E0E0);
  late Color accent4 = const Color(0xFFEEEEEE);
  late Color success = const Color(0xFF04A24C);
  late Color warning = const Color(0xFFFCDC0C);
  late Color error = const Color(0xFFE21C3D);
  late Color info = const Color(0xFF1C4494);

  late Color borderColor = Color(0xFF6DA2C6);
  late Color iconColor = Color(0xFFD0D0D0);
  late Color buttonColor = Color(0xFF49ACF3);
  late Color btnText = Color(0xFFFFFFFF);
  late Color lineColor = Color(0xFFDBE2E7);
  late Color customColor3 = Color(0xFFDF3F3F);
  late Color customColor4 = Color(0xFF090F13);
  late Color white = Color(0xFFFFFFFF);
  late Color background = Color(0xFF1D2429);
  late Color borderSecondary = Color(0xFFFFFFFF);
  late Color iconblueContainer = Color(0xFFEBF7FD);
  late Color iconbluecolour = Color(0xFF32A7E2);
  late Color iconeditcontainer = Color(0xFFE9F8F2);
  late Color iconeditcolour = Color(0xFF22B07D);
  late Color iconContailnerMain = Color(0xFFFFFFFF);
  late Color divider = Color(0xFFDADADA);
  late Color iconbluecolour2 = Color(0xFF838B96);
  late Color deletebtncontainer = Color(0xFFFFEBEB);
  late Color boxShadowcolour = Color(0x33000000);
  late Color whitecontainer = Color(0xFFFFFFFF);
  late Color iconcontainerdashboard = Color(0xFFEEEEEE);
  late Color loginPageColour = Color(0xFF49ACF3);
  late Color primaryBtnText = Color(0xFFFFFFFF);
  late Color greencontainer = Color(0xFFE9F8F2);
}

abstract class Typography {
  String get displayLargeFamily;
  TextStyle get displayLarge;
  String get displayMediumFamily;
  TextStyle get displayMedium;
  String get displaySmallFamily;
  TextStyle get displaySmall;
  String get headlineLargeFamily;
  TextStyle get headlineLarge;
  String get headlineMediumFamily;
  TextStyle get headlineMedium;
  String get headlineSmallFamily;
  TextStyle get headlineSmall;
  String get titleLargeFamily;
  TextStyle get titleLarge;
  String get titleMediumFamily;
  TextStyle get titleMedium;
  String get titleSmallFamily;
  TextStyle get titleSmall;
  String get labelLargeFamily;
  TextStyle get labelLarge;
  String get labelMediumFamily;
  TextStyle get labelMedium;
  String get labelSmallFamily;
  TextStyle get labelSmall;
  String get bodyLargeFamily;
  TextStyle get bodyLarge;
  String get bodyMediumFamily;
  TextStyle get bodyMedium;
  String get bodySmallFamily;
  TextStyle get bodySmall;
}

class ThemeTypography extends Typography {
  ThemeTypography(this.theme);

  final FlutterFlowTheme theme;

  String get displayLargeFamily => 'Poppins';
  TextStyle get displayLarge => GoogleFonts.getFont(
    'Poppins',
    color: theme.iconeditcolour,
    fontWeight: FontWeight.normal,
    fontSize: 11.0,
  );
  String get displayMediumFamily => 'Poppins';
  TextStyle get displayMedium => GoogleFonts.getFont(
    'Poppins',
    color: theme.iconeditcolour,
    fontWeight: FontWeight.w600,
    fontSize: 15.0,
  );
  String get displaySmallFamily => 'Poppins';
  TextStyle get displaySmall => GoogleFonts.getFont(
    'Poppins',
    color: theme.primaryText,
    fontWeight: FontWeight.w600,
    fontSize: 24.0,
  );
  String get headlineLargeFamily => 'Poppins';
  TextStyle get headlineLarge => GoogleFonts.getFont(
    'Poppins',
    color: theme.primaryText,
    fontWeight: FontWeight.normal,
    fontSize: 32.0,
  );
  String get headlineMediumFamily => 'Poppins';
  TextStyle get headlineMedium => GoogleFonts.getFont(
    'Poppins',
    color: theme.secondaryText,
    fontWeight: FontWeight.w600,
    fontSize: 22.0,
  );
  String get headlineSmallFamily => 'Poppins';
  TextStyle get headlineSmall => GoogleFonts.getFont(
    'Poppins',
    color: theme.primaryText,
    fontWeight: FontWeight.w600,
    fontSize: 20.0,
  );
  String get titleLargeFamily => 'Poppins';
  TextStyle get titleLarge => GoogleFonts.getFont(
    'Poppins',
    color: theme.primaryText,
    fontWeight: FontWeight.w500,
    fontSize: 22.0,
  );
  String get titleMediumFamily => 'Poppins';
  TextStyle get titleMedium => GoogleFonts.getFont(
    'Poppins',
    color: theme.primaryText,
    fontWeight: FontWeight.w600,
    fontSize: 18.0,
  );
  String get titleSmallFamily => 'Poppins';
  TextStyle get titleSmall => GoogleFonts.getFont(
    'Poppins',
    color: theme.secondaryText,
    fontWeight: FontWeight.normal,
    fontSize: 12.0,
  );
  String get labelLargeFamily => 'Poppins';
  TextStyle get labelLarge => GoogleFonts.getFont(
    'Poppins',
    color: theme.primaryText,
    fontWeight: FontWeight.w500,
    fontSize: 14.0,
  );
  String get labelMediumFamily => 'Poppins';
  TextStyle get labelMedium => GoogleFonts.getFont(
    'Poppins',
    color: theme.primary,
    fontWeight: FontWeight.w500,
    fontSize: 12.0,
  );
  String get labelSmallFamily => 'Poppins';
  TextStyle get labelSmall => GoogleFonts.getFont(
    'Poppins',
    color: theme.primaryText,
    fontWeight: FontWeight.w500,
    fontSize: 11.0,
  );
  String get bodyLargeFamily => 'Poppins';
  TextStyle get bodyLarge => GoogleFonts.getFont(
    'Poppins',
    color: theme.white,
    fontSize: 14.0,
  );
  String get bodyMediumFamily => 'Poppins';
  TextStyle get bodyMedium => GoogleFonts.getFont(
    'Poppins',
    color: theme.primaryText,
    fontWeight: FontWeight.w500,
    fontSize: 12.0,
  );
  String get bodySmallFamily => 'Poppins';
  TextStyle get bodySmall => GoogleFonts.getFont(
    'Poppins',
    color: theme.secondaryText,
    fontWeight: FontWeight.normal,
    fontSize: 10.0,
  );
}

class DarkModeTheme extends FlutterFlowTheme {
  @Deprecated('Use primary instead')
  Color get primaryColor => primary;
  @Deprecated('Use secondary instead')
  Color get secondaryColor => secondary;
  @Deprecated('Use tertiary instead')
  Color get tertiaryColor => tertiary;

  late Color primary = const Color(0xFF4B39EF);
  late Color secondary = const Color(0xFF39D2C0);
  late Color tertiary = const Color(0xFFEE8B60);
  late Color alternate = const Color(0xFF282A2E);
  late Color primaryText = const Color(0xFFFFFFFF);
  late Color secondaryText = const Color(0xFFDADADA);
  late Color primaryBackground = const Color(0xFF454D55);
  late Color secondaryBackground = const Color(0xFF101213);
  late Color accent1 = const Color(0xFFEEEEEE);
  late Color accent2 = const Color(0xFFE0E0E0);
  late Color accent3 = const Color(0xFF757575);
  late Color accent4 = const Color(0xFF616161);
  late Color success = const Color(0xFF04A24C);
  late Color warning = const Color(0xFFFCDC0C);
  late Color error = const Color(0xFFE21C3D);
  late Color info = const Color(0xFF1C4494);

  late Color borderColor = Color(0xFF14BED9);
  late Color iconColor = Color(0xFFD0D0D0);
  late Color buttonColor = Color(0xFF3F6791);
  late Color btnText = Color(0xFFFFFFFF);
  late Color lineColor = Color(0xFF323B45);
  late Color customColor3 = Color(0xFFDF3F3F);
  late Color customColor4 = Color(0xFF090F13);
  late Color white = Color(0xFFFFFFFF);
  late Color background = Color(0xFF1D2429);
  late Color borderSecondary = Color(0xFF772221);
  late Color iconblueContainer = Color(0xFFEBF7FD);
  late Color iconbluecolour = Color(0xFF32A7E2);
  late Color iconeditcontainer = Color(0xFFE9F8F2);
  late Color iconeditcolour = Color(0xFF22B07D);
  late Color iconContailnerMain = Color(0xFFFFFFFF);
  late Color divider = Color(0xFFFFFFFF);
  late Color iconbluecolour2 = Color(0xFF32A7E7);
  late Color deletebtncontainer = Color(0xFF447C7F);
  late Color boxShadowcolour = Color(0x33000000);
  late Color whitecontainer = Color(0xFF3F6791);
  late Color iconcontainerdashboard = Color(0xFFFFFFFF);
  late Color loginPageColour = Color(0xFF3F6791);
  late Color primaryBtnText = Color(0xFFFFFFFF);
  late Color greencontainer = Color(0xFF7372B4);
}

extension TextStyleHelper on TextStyle {
  TextStyle override({
    String? fontFamily,
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    double? letterSpacing,
    FontStyle? fontStyle,
    bool useGoogleFonts = true,
    TextDecoration? decoration,
    double? lineHeight,
  }) =>
      useGoogleFonts
          ? GoogleFonts.getFont(
        fontFamily!,
        color: color ?? this.color,
        fontSize: fontSize ?? this.fontSize,
        letterSpacing: letterSpacing ?? this.letterSpacing,
        fontWeight: fontWeight ?? this.fontWeight,
        fontStyle: fontStyle ?? this.fontStyle,
        decoration: decoration,
        height: lineHeight,
      )
          : copyWith(
        fontFamily: fontFamily,
        color: color,
        fontSize: fontSize,
        letterSpacing: letterSpacing,
        fontWeight: fontWeight,
        fontStyle: fontStyle,
        decoration: decoration,
        height: lineHeight,
      );
}
