class SignUpModel {
  final String name;
  final String email;
  final String password;
  final String confirmPassword;

  SignUpModel({
    required this.name,
    required this.email,
    required this.password,
    required this.confirmPassword,
  });

  // Convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'password': password,
      'confirmPassword': confirmPassword,
    };
  }

  // Create from JSON
  factory SignUpModel.fromJson(Map<String, dynamic> json) {
    return SignUpModel(
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      password: json['password'] ?? '',
      confirmPassword: json['confirmPassword'] ?? '',
    );
  }

  // Copy with method for updates
  SignUpModel copyWith({
    String? name,
    String? email,
    String? password,
    String? confirmPassword,
  }) {
    return SignUpModel(
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
    );
  }

  @override
  String toString() {
    return 'SignUpModel(name: $name, email: $email, password: ${password.replaceRange(0, password.length, '*' * password.length)}, confirmPassword: ${confirmPassword.replaceRange(0, confirmPassword.length, '*' * confirmPassword.length)})';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is SignUpModel &&
        other.name == name &&
        other.email == email &&
        other.password == password &&
        other.confirmPassword == confirmPassword;
  }

  @override
  int get hashCode => name.hashCode ^ email.hashCode ^ password.hashCode ^ confirmPassword.hashCode;
}
