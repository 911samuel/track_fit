import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:track_fit/core/theme/app_colors.dart';
import 'package:track_fit/core/theme/app_dimensions.dart';
import 'package:track_fit/ui/auth/view_model/auth_view_model.dart';
import 'package:track_fit/ui/auth/widget/auth_form.dart';
import 'package:track_fit/ui/auth/widget/auth_header.dart';
import 'package:track_fit/ui/auth/widget/auth_submit_button.dart';
import 'package:track_fit/ui/auth/widget/auth_toggle_button.dart';
import 'package:track_fit/ui/auth/widget/auth_welcome_section.dart';
import 'package:track_fit/ui/onboarding/view/onBoarding_screen.dart';

class AuthScreen extends ConsumerStatefulWidget {
  const AuthScreen({super.key});

  @override
  ConsumerState<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends ConsumerState<AuthScreen>
    with TickerProviderStateMixin {
  late AuthViewModel vm;

  @override
  void initState() {
    super.initState();
    vm = ref.read(authViewModelProvider);
    vm.init(this);
  }

  @override
  void dispose() {
    vm.disposeControllers();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final vm = ref.watch(authViewModelProvider);

    return Scaffold(
      backgroundColor: AppColors.darkBackground,
      body: SafeArea(
        child: AnimatedBuilder(
          animation: vm.fadeAnimation,
          builder: (context, child) {
            return SlideTransition(
              position: vm.slideAnimation,
              child: FadeTransition(
                opacity: vm.fadeAnimation,
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(AppDimensions.paddingL),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AuthHeader(
                        onBackTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const OnboardingScreen(),
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: AppDimensions.spaceXXL),
                      AuthWelcomeSection(vm: vm),
                      const SizedBox(height: AppDimensions.spaceXXL),
                      AuthForm(vm: vm),
                      const SizedBox(height: AppDimensions.spaceL),
                      AuthSubmitButton(vm: vm),
                      const SizedBox(height: AppDimensions.spaceXL),
                      AuthToggleButton(vm: vm),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
