/// [Constants] contains some constant value for our app. For example the size
/// for texts and the spacing between components.
///
/// It also contains the redirect urls for the Google and OIDC provider.
class Constants {
  static const sizeTextPrimary = 16.0;
  static const sizeTextSecondary = 14.0;
  static const sizeBorderRadius = 12.0;
  static const sizeBorderBlurRadius = 4.0;
  static const sizeBorderSpreadRadius = 1.0;

  static const spacingExtraSmall = 4.0;
  static const spacingSmall = 8.0;
  static const spacingMiddle = 16.0;
  static const spacingLarge = 24.0;
  static const spacingExtraLarge = 32.0;

  static const spacingIcon54x54 = 6.0;

  static const opacityIcon = 0.25;

  static const pageIndexHome = 0;
  static const pageIndexResources = 1;
  static const pageIndexPlugins = 2;
  static const pageIndexSettings = 3;

  static const googleRedirectURI = 'https://kubenav.io/auth/google.html';
  static const oidcRedirectURI = 'https://kubenav.io/auth/oidc.html';
}
