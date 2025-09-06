import '../model/login_model.dart';
import '../model/signup_model.dart';

class AuthResult {
  final bool success;
  final String? message;
  final String? token;

  AuthResult({
    required this.success,
    this.message,
    this.token,
  });
}

class AuthService {
  // Simulate API call delay
  static const Duration _apiDelay = Duration(seconds: 2);
  
  // Mock user credentials for demo
  static const String _mockEmail = 'user@example.com';
  static const String _mockPassword = 'password123';
  
  /// Authenticate user with email and password
  Future<AuthResult> login(LoginModel loginModel) async {
    try {
      // Simulate API call delay
      await Future.delayed(_apiDelay);
      
      // Mock authentication logic
      if (loginModel.email == _mockEmail && loginModel.password == _mockPassword) {
        return AuthResult(
          success: true,
          message: 'Login successful!',
          token: 'mock_jwt_token_${DateTime.now().millisecondsSinceEpoch}',
        );
      } else {
        return AuthResult(
          success: false,
          message: 'Invalid email or password',
        );
      }
    } catch (e) {
      return AuthResult(
        success: false,
        message: 'Network error: ${e.toString()}',
      );
    }
  }
  
  /// Register new user
  Future<AuthResult> signUp(SignUpModel signUpModel) async {
    try {
      // Simulate API call delay
      await Future.delayed(_apiDelay);
      
      // Mock validation logic
      if (signUpModel.password != signUpModel.confirmPassword) {
        return AuthResult(
          success: false,
          message: 'Passwords do not match',
        );
      }
      
      // Mock email already exists check
      if (signUpModel.email == _mockEmail) {
        return AuthResult(
          success: false,
          message: 'Email already exists',
        );
      }
      
      // Mock successful registration
      return AuthResult(
        success: true,
        message: 'Account created successfully!',
        token: 'mock_jwt_token_${DateTime.now().millisecondsSinceEpoch}',
      );
    } catch (e) {
      return AuthResult(
        success: false,
        message: 'Network error: ${e.toString()}',
      );
    }
  }
  
  /// Logout user
  Future<AuthResult> logout() async {
    try {
      // Simulate API call delay
      await Future.delayed(const Duration(seconds: 1));
      
      return AuthResult(
        success: true,
        message: 'Logged out successfully',
      );
    } catch (e) {
      return AuthResult(
        success: false,
        message: 'Logout error: ${e.toString()}',
      );
    }
  }
  
  /// Check if user is authenticated
  Future<bool> isAuthenticated() async {
    // In a real app, you would check stored token validity
    return false;
  }
  
  /// Refresh authentication token
  Future<AuthResult> refreshToken() async {
    try {
      await Future.delayed(const Duration(seconds: 1));
      
      return AuthResult(
        success: true,
        token: 'refreshed_jwt_token_${DateTime.now().millisecondsSinceEpoch}',
      );
    } catch (e) {
      return AuthResult(
        success: false,
        message: 'Token refresh failed: ${e.toString()}',
      );
    }
  }
}
