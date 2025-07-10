import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:track_fit/core/theme/app_colors.dart';
import 'package:track_fit/ui/onboarding/widget/onBoarding_bottom_section.dart';
import 'package:track_fit/ui/onboarding/widget/onboarding_progress_indicator.dart';
import 'package:track_fit/ui/onboarding/widget/onboarding_slides.dart';
import 'package:track_fit/ui/onboarding/widget/onboarding_top_bar.dart';
import '../view_model/onboarding_view_model.dart';

class OnboardingScreen extends ConsumerStatefulWidget {
  const OnboardingScreen({super.key});

  @override
  ConsumerState<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends ConsumerState<OnboardingScreen>
    with TickerProviderStateMixin {
  late AnimationController _fadeController;
  late AnimationController _slideController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );
    _slideController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _fadeController, curve: Curves.easeInOut),
    );
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(parent: _slideController, curve: Curves.elasticOut),
    );

    _fadeController.forward();
    _slideController.forward();
  }

  @override
  void dispose() {
    _fadeController.dispose();
    _slideController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(onboardingProvider);
    final viewModel = ref.read(onboardingProvider.notifier);

    return Scaffold(
      backgroundColor: AppColors.darkBackground,
      body: SafeArea(
        child: Column(
          children: [
            OnboardingTopBar(state: state, viewModel: viewModel),
            OnboardingProgressIndicator(state: state),
            Expanded(
              child: PageView.builder(
                controller: state.pageController,
                onPageChanged: viewModel.onPageChanged,
                itemCount: OnboardingViewModel.slides.length,
                itemBuilder: (context, index) {
                  return OnboardingSlides(
                    slide: OnboardingViewModel.slides[index],
                    index: index,
                    fadeAnimation: _fadeAnimation,
                    slideAnimation: _slideAnimation,
                  );
                },
              ),
            ),
            OnboardingBottomSection(state: state, viewModel: viewModel),
          ],
        ),
      ),
    );
  }
}
