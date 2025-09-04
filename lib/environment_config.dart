class EnvironmentConfig {
  // App Configuration
  static const String appName = 'Login App';
  static const String appVersion = '1.0.0';
  
  // API Configuration
  static const String baseUrl = 'https://api.example.com';
  static const String apiVersion = 'v1';
  
  // Environment
  static const bool isProduction = false;
  static const bool enableLogging = true;
  
  // Authentication
  static const int sessionTimeoutMinutes = 30;
  static const bool enableBiometricAuth = false;
  
  // UI Configuration
  static const double defaultPadding = 16.0;
  static const double defaultBorderRadius = 12.0;
  
  // Get full API URL
  static String get apiUrl => '$baseUrl/$apiVersion';
  
  // Get environment-specific settings
  static Map<String, dynamic> get environmentSettings => {
    'isProduction': isProduction,
    'enableLogging': enableLogging,
    'baseUrl': baseUrl,
    'apiVersion': apiVersion,
  };
}
