import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/theme/app_dimensions.dart';
import '../view_model/auth_view_model.dart';

class AuthForm extends StatelessWidget {
  final AuthViewModel vm;

  const AuthForm({super.key, required this.vm});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: vm.formKey,
      child: Column(
        children: [
          if (!vm.isLoginMode)
            _buildTextField(
              controller: vm.nameController,
              label: "Full Name",
              hint: "Enter your full name",
              icon: Icons.person_outline,
              validator:
                  (v) => v!.isEmpty ? 'Please enter your full name' : null,
            ),
          const SizedBox(height: AppDimensions.spaceL),
          _buildTextField(
            controller: vm.emailController,
            label: "Email",
            hint: "Enter your email",
            icon: Icons.email_outlined,
            keyboardType: TextInputType.emailAddress,
            validator:
                (v) =>
                    v!.isEmpty || !v.contains('@') ? 'Enter valid email' : null,
          ),
          const SizedBox(height: AppDimensions.spaceL),
          _buildTextField(
            controller: vm.passwordController,
            label: "Password",
            hint: "Enter your password",
            icon: Icons.lock_outline,
            isPassword: true,
            isPasswordVisible: vm.isPasswordVisible,
            onTogglePassword: vm.togglePasswordVisibility,
            validator: (v) => v!.length < 6 ? 'Min 6 characters' : null,
          ),
          const SizedBox(height: AppDimensions.spaceL),
          if (!vm.isLoginMode)
            _buildTextField(
              controller: vm.confirmPasswordController,
              label: "Confirm Password",
              hint: "Confirm your password",
              icon: Icons.lock_outline,
              isPassword: true,
              isPasswordVisible: vm.isConfirmPasswordVisible,
              onTogglePassword: vm.toggleConfirmPasswordVisibility,
              validator:
                  (v) =>
                      v != vm.passwordController.text
                          ? 'Passwords do not match'
                          : null,
            ),
          const SizedBox(height: AppDimensions.spaceL),
        ],
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String hint,
    required IconData icon,
    TextInputType keyboardType = TextInputType.text,
    bool isPassword = false,
    bool isPasswordVisible = false,
    VoidCallback? onTogglePassword,
    String? Function(String?)? validator,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: AppTextStyles.onboardingFeature),
        const SizedBox(height: AppDimensions.spaceL),
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          obscureText: isPassword && !isPasswordVisible,
          validator: validator,
          decoration: InputDecoration(
            hintText: hint,
            prefixIcon: Icon(icon, color: AppColors.primaryNeon),
            suffixIcon:
                isPassword
                    ? GestureDetector(
                      onTap: onTogglePassword,
                      child: Icon(
                        isPasswordVisible
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: AppColors.primaryNeon,
                      ),
                    )
                    : null,
            filled: true,
            fillColor: AppColors.cardGray,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppDimensions.radiusM),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ],
    );
  }
}
