import 'package:flutter/material.dart';

class AppColors {
  const AppColors({
    required this.primaryMain,
    required this.primaryText,
    required this.primaryTextOnContrast,
    required this.primaryBackground,
    required this.secondaryMain,
    required this.secondaryText,
    required this.secondaryBackgroundPrimary,
    required this.secondaryBackgroundSecondary,
    required this.gradientStartMain,
    required this.gradientEndMain,
    required this.gradientStartBackground,
    required this.gradientEndBackground,
    required this.backgroundPrimary,
    required this.backgroundSecondary,
    required this.surface,
    required this.action,
    required this.border,
    required this.backgroundContrast,
    required this.textPrimary,
    required this.textSecondary,
    required this.textContrastOnDark,
    required this.textContrastOnLight,
    required this.textContrastOnContrastBackground,
    required this.iconPrimary,
    required this.iconSecondary,
    required this.backdropPrimary,
    required this.backdropSecondary,
    required this.backgroundTransparent,
    required this.contentSpecialMain,
    required this.contentSpecialText,
    required this.contentSpecialBackground,
    required this.contentVideo,
    required this.contentArticle,
    required this.contentEntry,
    required this.contentAlert,
    required this.error,
    required this.success,
    required this.information,
    required this.alert,
    required this.playerBackdrop,
    required this.playerTextPrimary,
    required this.playerTextSecondary,
    required this.googleButton,
    required this.yahooButton,
  });

  /// Used for buttons colors, filled tags etc.
  final Color primaryMain;

  /// Used for text, links, icons and smaller details that require a higher contrast.
  final Color primaryText;

  /// Used for text, links, icons and smaller details that require a higher contrast over a contrast background.
  final Color primaryTextOnContrast;

  /// Used as a background color for secondary buttons, tag, banners, tooltip etc.
  final Color primaryBackground;

  /// Used for tags and other accent elements.
  final Color secondaryMain;

  /// Used for text, icons and smaller details that require a higher contrast.
  final Color secondaryText;

  /// Used as a background color for banners, tooltip etc.
  final Color secondaryBackgroundPrimary;

  /// Used as a background color for banners, tooltip etc. .
  final Color secondaryBackgroundSecondary;

  /// Gradient Start - Used for buttons colors, filled tags, icons etc.
  final Color gradientStartMain;

  /// Gradient End - Used for buttons colors, filled tags, icons etc.
  final Color gradientEndMain;

  /// Gradient Start - Used as a background color for banners, tooltip etc.
  final Color gradientStartBackground;

  /// Gradient End - Used as a background color for banners, tooltip etc.
  final Color gradientEndBackground;

  /// Used as main background color
  final Color backgroundPrimary;

  /// Used as a secondary background between sections of content.
  final Color backgroundSecondary;

  /// Used as background for cards and sheets
  final Color surface;

  /// Used as a fill color for tags, input etc.
  final Color action;

  /// Used for dividers and borders
  final Color border;

  /// Used for snackbars and other elements that need to contrast the default background
  final Color backgroundContrast;

  /// Used for primary text
  final Color textPrimary;

  /// Used for secondary text
  final Color textSecondary;

  /// Used as a contrasting text over dark fill colors
  final Color textContrastOnDark;

  /// Used as a contrasting text over light fill colors
  final Color textContrastOnLight;

  /// Text over contrast background
  final Color textContrastOnContrastBackground;

  /// Used for icon buttons etc.
  final Color iconPrimary;

  /// Used for decorative icons
  final Color iconSecondary;

  /// Used to dim the background of modals/alerts as well as for a transparent background
  final Color backdropPrimary;

  /// Used to dim the background of modals/alerts as well as for a transparent background
  final Color backdropSecondary;

  /// Used for a transparent background of login form (input)
  final Color backgroundTransparent;

  /// Used for content tags for live content and seek bar, as well as trending content
  /// Used for Label, icon etc.
  final Color contentSpecialMain;

  /// Used for text, links, icons and smaller details that require a higher contrast.
  final Color contentSpecialText;

  /// Used as a background color for secondary buttons, tag, banners, tooltip etc.
  final Color contentSpecialBackground;

  /// Used for content tags for video content
  final Color contentVideo;

  /// Used for content tags for articles
  final Color contentArticle;

  /// Used for content tags for entries
  final Color contentEntry;

  /// Used for badges to indicate new content & birthday alert
  final Color contentAlert;

  /// Used for error states
  final Color error;

  /// Used for success states
  final Color success;

  /// Used for Information states
  final Color information;

  /// Used for Alert states
  final Color alert;

  /// Player colors
  final Color playerBackdrop;
  final Color playerTextPrimary;
  final Color playerTextSecondary;

  /// Other colors
  final Color googleButton;
  final Color yahooButton;
}

const colorsLight = AppColors(
  /// Primary
  primaryMain: Color(0xFF9428E8),
  primaryText: Color(0xFF5B089C),
  primaryTextOnContrast: Color(0xFFBF84ED),
  primaryBackground: Color(0xFFF6EBFF),

  /// Secondary
  secondaryMain: Color(0xFF26ACD7),
  secondaryText: Color(0xFF076F90),
  secondaryBackgroundPrimary: Color(0xFFD8F2FA),
  secondaryBackgroundSecondary: Color(0xFF076F91),

  /// Gradient
  gradientStartMain: Color(0xFFB100FF),
  gradientEndMain: Color(0xFF59C0FB),
  gradientStartBackground: Color(0x4DB100FF),
  gradientEndBackground: Color(0x4D35A8E9),

  /// Backgrounds
  backgroundPrimary: Color(0xFFFFFFFF),
  backgroundSecondary: Color(0xFFF6F6F6),
  backgroundContrast: Color(0xFF1B2124),
  backgroundTransparent: Color(0x66EDEDF2),

  /// Backdrops
  backdropPrimary: Color(0x80000000),
  backdropSecondary: Color(0xB3FFFFFF),

  /// Components
  surface: Color(0xFFFFFFFF),
  action: Color(0xFFEDEDF2),
  border: Color(0xB3C2C4CA),

  /// Text
  textPrimary: Color(0xFF1B2124),
  textSecondary: Color(0xFF797989),
  textContrastOnDark: Color(0xFFFFFFFF),
  textContrastOnLight: Color(0xFF1B2124),
  textContrastOnContrastBackground: Color(0xFFFFFFFF),

  /// Icons
  iconPrimary: Color(0xFF3F4252),
  iconSecondary: Color(0xFFAEB0B8),

  /// Content
  contentSpecialMain: Color(0xFFFD3535),
  contentSpecialText: Color(0xFFEA2525),
  contentSpecialBackground: Color(0xFFFFE9E9),
  contentAlert: Color(0xFFFF1F62),
  contentVideo: Color(0xFFD653E1),
  contentEntry: Color(0xFFEA6E28),
  contentArticle: Color(0xFF71A957),

  /// Semantic
  success: Color(0xFF54A447),
  error: Color(0xFFEE4545),
  information: Color(0xFF2196F3),
  alert: Color(0xFFFF8800),

  /// Player colors
  playerTextSecondary: Color(0xFF9B9B9B),
  playerBackdrop: Color(0xFF000000),
  playerTextPrimary: Color(0xFFFFFFFF),

  /// Other colors
  googleButton: Color(0xFF4285F4),
  yahooButton: Color(0xFFFF0033),
);

const colorsDark = AppColors(
  /// Primary
  primaryMain: Color(0xFFA33FF2),
  primaryText: Color(0xFFBF84ED),
  primaryTextOnContrast: Color(0xFF5B089C),
  primaryBackground: Color(0xFF4C0E7C),

  /// Secondary
  secondaryMain: Color(0xFF28ACD6),
  secondaryText: Color(0xFF61C1DE),
  secondaryBackgroundPrimary: Color(0xFF074457),
  secondaryBackgroundSecondary: Color(0xFF076F91),

  /// Gradient
  gradientStartMain: Color(0xFFB100FF),
  gradientEndMain: Color(0xFF35A8E9),
  gradientStartBackground: Color(0x4DB100FF),
  gradientEndBackground: Color(0x4D35A8E9),

  /// Backgrounds
  backgroundPrimary: Color(0xFF0E0E0E),
  backgroundSecondary: Color(0xFF000000),
  backgroundContrast: Color(0xFFFFFFFF),
  backgroundTransparent: Color(0x66EDEDF2),

  /// Backdrops
  backdropPrimary: Color(0x80000000),
  backdropSecondary: Color(0xB2000000),

  /// Components
  surface: Color(0xFF1F1F25),
  action: Color(0xFF30323F),
  border: Color(0xB2404048),

  /// Text
  textPrimary: Color(0xFFFFFFFF),
  textSecondary: Color(0xFF85859F),
  textContrastOnDark: Color(0xFFFFFFFF),
  textContrastOnLight: Color(0xFF18181D),
  textContrastOnContrastBackground: Color(0xFF18181D),

  /// Icons
  iconPrimary: Color(0xFF6C6C86),
  iconSecondary: Color(0xFF4C4C63),

  /// Content
  contentSpecialMain: Color(0xFFFD3535),
  contentSpecialText: Color(0xFFFB7878),
  contentSpecialBackground: Color(0xFF440A0A),
  contentAlert: Color(0xFFFF1F62),
  contentVideo: Color(0xFFD653E1),
  contentEntry: Color(0xFFF17B39),
  contentArticle: Color(0xFF71A957),

  /// Semantic
  success: Color(0xFF54A447),
  error: Color(0xFFEE4545),
  information: Color(0xFF1D81D0),
  alert: Color(0xFFEB8716),

  /// Player colors
  playerTextSecondary: Color(0xFF9B9B9B),
  playerBackdrop: Color(0xFF000000),
  playerTextPrimary: Color(0xFFFFFFFF),

  /// Other colors
  googleButton: Color(0xFF4285F4),
  yahooButton: Color(0xFFFF0033),
);

extension AppColorsExtension on BuildContext {
  AppColors get colors {
    final brightness = Theme.of(this).brightness;
    switch (brightness) {
      case Brightness.light:
        return colorsLight;
      case Brightness.dark:
        return colorsDark;
      default:
        return colorsLight;
    }
  }
}
