import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authViewModelProvider = ChangeNotifierProvider<AuthViewModel>(
  (ref) => AuthViewModel(),
);

class AuthViewModel extends ChangeNotifier {
  late AnimationController fadeController;
  late AnimationController slideController;
  late AnimationController flipController;

  late Animation<double> fadeAnimation;
  late Animation<Offset> slideAnimation;
  late Animation<double> flipAnimation;

  bool isLoginMode = true;
  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;
  bool isLoading = false;

  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final nameController = TextEditingController();

  void init(TickerProvider vsync) {
    fadeController = AnimationController(
      vsync: vsync,
      duration: const Duration(milliseconds: 600),
    );
    slideController = AnimationController(
      vsync: vsync,
      duration: const Duration(milliseconds: 800),
    );
    flipController = AnimationController(
      vsync: vsync,
      duration: const Duration(milliseconds: 500),
    );

    fadeAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(parent: fadeController, curve: Curves.easeInOut));
    slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(parent: slideController, curve: Curves.elasticOut),
    );
    flipAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(parent: flipController, curve: Curves.easeInOut));

    fadeController.forward();
    slideController.forward();
  }

  void disposeControllers() {
    fadeController.dispose();
    slideController.dispose();
    flipController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    nameController.dispose();
    super.dispose();
  }

  void toggleAuthMode() {
    isLoginMode = !isLoginMode;
    flipController.reset();
    flipController.forward();
    notifyListeners();
  }

  Future<void> submitForm(BuildContext context) async {
    if (!formKey.currentState!.validate()) return;

    isLoading = true;
    notifyListeners();

    await Future.delayed(const Duration(seconds: 2));

    isLoading = false;
    notifyListeners();

    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            isLoginMode ? 'Login successful!' : 'Registration successful!',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
      );
    }
  }

  void togglePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
    notifyListeners();
  }

  void toggleConfirmPasswordVisibility() {
    isConfirmPasswordVisible = !isConfirmPasswordVisible;
    notifyListeners();
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthViewModel(isLoginMode: $isLoginMode, isLoading: $isLoading)';
  }
}
