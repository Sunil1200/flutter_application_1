import 'package:flutter/material.dart';
import '../model/login_model.dart';
import '../services/auth_service.dart';

class LoginController extends ChangeNotifier {
  final AuthService _authService = AuthService();
  
  // Form controllers
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  
  // Form key for validation
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  
  // State variables
  bool _isLoading = false;
  bool _isPasswordVisible = false;
  String? _errorMessage;
  
  // Getters
  bool get isLoading => _isLoading;
  bool get isPasswordVisible => _isPasswordVisible;
  String? get errorMessage => _errorMessage;
  
  // Toggle password visibility
  void togglePasswordVisibility() {
    _isPasswordVisible = !_isPasswordVisible;
    notifyListeners();
  }
  
  // Validate email
  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }
  
  // Validate password
  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }
  
  // Handle login
  Future<bool> handleLogin() async {
    if (!formKey.currentState!.validate()) {
      return false;
    }
    
    _setLoading(true);
    _clearError();
    
    try {
      final loginModel = LoginModel(
        email: emailController.text.trim(),
        password: passwordController.text,
      );
      
      final result = await _authService.login(loginModel);
      
      if (result.success) {
        _clearError();
        return true;
      } else {
        _setError(result.message ?? 'Login failed');
        return false;
      }
    } catch (e) {
      _setError('An error occurred: ${e.toString()}');
      return false;
    } finally {
      _setLoading(false);
    }
  }
  
  // Set loading state
  void _setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }
  
  // Set error message
  void _setError(String error) {
    _errorMessage = error;
    notifyListeners();
  }
  
  // Clear error message
  void _clearError() {
    _errorMessage = null;
    notifyListeners();
  }
  
  // Clear form
  void clearForm() {
    emailController.clear();
    passwordController.clear();
    _clearError();
    notifyListeners();
  }
  
  // Handle forgot password
  void handleForgotPassword() {
    // TODO: Implement forgot password logic
    _setError('Forgot password feature coming soon!');
  }
  
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
